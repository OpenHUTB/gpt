""" 增加两辆闯红灯的车，在各自闯红灯的时候切换视角 """

import glob
import os
import sys
import carla
import argparse
import logging
from numpy import random

try:
    sys.path.append(glob.glob('../carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
RUN_RED_LIGHT_VEHICLE_NUM = 2


def get_actor_blueprints(world, filter, generation):
    bps = world.get_blueprint_library().filter(filter)

    if generation.lower() == "all":
        return bps

    # If the filter returns only one bp, we assume that this one needed
    # and therefore, we ignore the generation
    if len(bps) == 1:
        return bps

    try:
        int_generation = int(generation)
        # Check if generation is in available generations
        if int_generation in [1, 2]:
            bps = [x for x in bps if int(x.get_attribute('generation')) == int_generation]
            return bps
        else:
            print("   Warning! Actor Generation is not valid. No actor will be spawned.")
            return []
    except:
        print("   Warning! Actor Generation is not valid. No actor will be spawned.")
        return []


def main():
    argparser = argparse.ArgumentParser(
        description=__doc__)
    argparser.add_argument(
        '--host',
        metavar='H',
        default='127.0.0.1',
        help='IP of the host server (default: 127.0.0.1)')
    argparser.add_argument(
        '-p', '--port',
        metavar='P',
        default=2000,
        type=int,
        help='TCP port to listen to (default: 2000)')
    argparser.add_argument(
        '-n', '--number-of-vehicles',
        metavar='N',
        default=30,
        type=int,
        help='Number of vehicles (default: 30)')
    argparser.add_argument(
        '--filterv',
        metavar='PATTERN',
        default='vehicle.*',
        help='Filter vehicle model (default: "vehicle.*")')
    argparser.add_argument(
        '--generationv',
        metavar='G',
        default='All',
        help='restrict to certain vehicle generation (values: "1","2","All" - default: "All")')
    argparser.add_argument(
        '--filterw',
        metavar='PATTERN',
        default='walker.pedestrian.*',
        help='Filter pedestrian type (default: "walker.pedestrian.*")')
    argparser.add_argument(
        '--tm-port',
        metavar='P',
        default=8000,
        type=int,
        help='Port to communicate with TM (default: 8000)')

    args = argparser.parse_args()

    logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.INFO)

    vehicles_list = []
    client = carla.Client(args.host, args.port)
    client.set_timeout(10.0)
    world = client.get_world()
    try:

        settings = world.get_settings()
        settings.synchronous_mode = True
        settings.fixed_delta_seconds = 0.05
        world.apply_settings(settings)

        traffic_manager = client.get_trafficmanager(args.tm_port)
        traffic_manager.set_global_distance_to_leading_vehicle(2.5)
        traffic_manager.set_synchronous_mode(True)

        blueprints = get_actor_blueprints(world, args.filterv, args.generationv)
        blueprints = sorted(blueprints, key=lambda bp: bp.id)

        spawn_points = world.get_map().get_spawn_points()
        number_of_spawn_points = len(spawn_points)

        if args.number_of_vehicles < number_of_spawn_points:
            random.shuffle(spawn_points)
        elif args.number_of_vehicles > number_of_spawn_points:
            msg = 'requested %d vehicles, but could only find %d spawn points'
            logging.warning(msg, args.number_of_vehicles, number_of_spawn_points)
            args.number_of_vehicles = number_of_spawn_points

        # @todo cannot import these directly.
        SpawnActor = carla.command.SpawnActor
        SetAutopilot = carla.command.SetAutopilot
        FutureActor = carla.command.FutureActor

        # --------------
        # 产生车辆
        # --------------
        batch = []
        for n, transform in enumerate(spawn_points):
            if n >= args.number_of_vehicles:
                break
            blueprint = random.choice(blueprints)
            if blueprint.has_attribute('color'):
                color = random.choice(blueprint.get_attribute('color').recommended_values)
                blueprint.set_attribute('color', color)
            if blueprint.has_attribute('driver_id'):
                driver_id = random.choice(blueprint.get_attribute('driver_id').recommended_values)
                blueprint.set_attribute('driver_id', driver_id)

            # 产生车辆并设置他们的自动驾驶
            batch.append(SpawnActor(blueprint, transform).then(SetAutopilot(FutureActor, True, traffic_manager.get_port())))

        for response in client.apply_batch_sync(batch, True):
            if response.error:
                logging.error(response.error)
            else:
                vehicles_list.append(response.actor_id)

        traffic_manager.global_percentage_speed_difference(20.0)

        _vehicle_bp = world.get_blueprint_library().find('vehicle.audi.a2')
        if _vehicle_bp.has_attribute('color'):
            color = random.choice(_vehicle_bp.get_attribute('color').recommended_values)
            _vehicle_bp.set_attribute('color', color)
        spawn_points = world.get_map().get_spawn_points()

        _vehicle_list = []
        # 生成两辆车闯红灯，增加切换视角的概率
        for _vehicle_num in range(RUN_RED_LIGHT_VEHICLE_NUM):
            # 避免一次生成不了车辆
            i = 0
            _vehicle = world.try_spawn_actor(_vehicle_bp, spawn_points[0])
            while _vehicle is None:
                i += 1
                _vehicle = world.try_spawn_actor(_vehicle_bp, spawn_points[i])
            _vehicle_list.append(_vehicle)
            _vehicle.set_autopilot()
            # 设置车辆闯红灯
            traffic_manager.ignore_lights_percentage(_vehicle, 100)
        world.tick()
        # 防止两辆车都要切换视角
        already_change = False
        while True:
            for _vehicle in _vehicle_list:
                # 判断每辆闯红灯的车
                # 车辆在交通灯处且是红灯
                if _vehicle.is_at_traffic_light() and _vehicle.get_traffic_light_state() == carla.TrafficLightState.Red and not already_change:
                    # 切换视角至自车辆闯红灯
                    spectator = world.get_spectator()
                    _x = _vehicle.get_location().x
                    _y = _vehicle.get_location().y
                    _yaw = _vehicle.get_transform().rotation.yaw
                    location = carla.Location(x=_x, y=_y, z=2)
                    transform = carla.Transform(location, carla.Rotation(yaw=_yaw, pitch=-15, roll=0))
                    spectator.set_transform(transform)
                    already_change = True

            world.tick()
            already_change = False
    finally:

        settings = world.get_settings()
        settings.synchronous_mode = False
        settings.no_rendering_mode = False
        settings.fixed_delta_seconds = None
        world.apply_settings(settings)


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        pass
    finally:
        print('\ndone.')
