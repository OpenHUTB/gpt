
#!/usr/bin/env python

# Copyright (c) 2021 Computer Vision Center (CVC) at the Universitat Autonoma de
# Barcelona (UAB).
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.

"""闯红灯时其他车辆等待场景"""

import glob
import os
import random
import sys

try:
    sys.path.append(glob.glob('../carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import math
import carla
import argparse
import logging
import generate_traffic
import time

BRAKE_DISTANCE = 20
def vehicle_coming(world, walker):
    for actor in world.get_actors().filter("vehicle.*"):
        actual_distance = math.sqrt((walker.get_location().x - actor.get_location().x)**2 + (walker.get_location().y - actor.get_location().y)**2 + (walker.get_location().z - actor.get_location().z)**2)
        _yaw = actor.get_transform().rotation.yaw
        _y = actor.get_location().y
        w_y = walker.get_location().y
        _x = actor.get_location().x
        w_x = walker.get_location().x
        x_distance = abs(_x-w_x)
        # 车从左往右走和从右往左
        if ((_yaw > 80 and _yaw < 100 and _y < w_y) or (_yaw > -100 and _yaw < -80 and _y > w_y) and abs(
                _y - w_y) < BRAKE_DISTANCE) and actual_distance < 20 and x_distance < 2:
            return True
    return False


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
        '--tm-port',
        metavar='P',
        default=8000,
        type=int,
        help='Port to communicate with TM (default: 8000)')
    argparser.add_argument(
        '--asynch',
        action='store_true',
        help='Activate asynchronous mode execution')
    argparser.add_argument(
        '--filterw',
        metavar='PATTERN',
        default='walker.pedestrian.*',
        help='Filter pedestrian type (default: "walker.pedestrian.*")')
    argparser.add_argument(
        '--generationw',
        metavar='G',
        default='2',
        help='restrict to certain pedestrian generation (values: "1","2","All" - default: "2")')
    args = argparser.parse_args()
    client = carla.Client(args.host, args.port)
    client.set_timeout(10.0)
    synchronous_master = False
    try:
        world = client.get_world()
        # # 设置服务端同步
        # settings = world.get_settings()
        # settings.synchronous_mode = True
        # settings.fixed_delta_seconds = 0.02
        # world.apply_settings(settings)
        # world.debug.draw_string(carla.Location(x=-6, y=15, z=0.1), str(3),
        #                         life_time=600, color=carla.Color(255, 0, 0))

        transform = carla.Transform(carla.Location(x=-6, y=25, z=3), carla.Rotation(yaw=0))
        blueprints_Walkers = get_actor_blueprints(world, args.filterw, args.generationw)
        walker = world.try_spawn_actor(random.choice(blueprints_Walkers), transform)

        control = carla.WalkerControl(carla.Vector3D(x=5, y=0, z=0), speed=0.1)
        walker.apply_control(control)

        # 显示一次
        flag = False
        while True:
            if walker.get_location().x > 3:
                walker.destroy()
                flag = True
            # 销毁了重新生成
            if flag:
                walker = world.try_spawn_actor(random.choice(blueprints_Walkers), transform)
                control = carla.WalkerControl(carla.Vector3D(x=5, y=0, z=0), speed=0.1)
                walker.apply_control(control)
                flag = False
            w_x = walker.get_location().x
            if vehicle_coming(world, walker) and w_x > -2 and w_x <2:
                # 切换视角至自车辆闯红灯
                spectator = world.get_spectator()
                _x = walker.get_location().x
                _y = walker.get_location().y
                location = carla.Location(x=_x, y=_y, z=30)
                spectator_transform = carla.Transform(location, carla.Rotation(pitch=-90))
                spectator.set_transform(spectator_transform)
            world.wait_for_tick()
            # world.tick()
            time.sleep(0.01)
    finally:

        # 最后修改为异步模式
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
