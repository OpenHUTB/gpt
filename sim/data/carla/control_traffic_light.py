"""
    传入参数格式【组号， 组内编号， 设置路灯颜色， 设置颜色时长】
    组号:划分自右向左，自下而上，编号为1-5组，
    组内编号:正方形路口，从最底边的最左方开始逆时针编号1···n
    红绿灯对应编号:[绿-1， 黄-2， 红-3]
    红绿灯设置时间:以s为单位
"""


import glob
import os
import sys
import carla
import argparse
try:
    sys.path.append(glob.glob('../carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass


def main(group_id, in_group_id, color_id, color_time):
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

    args = argparser.parse_args()
    client = carla.Client(args.host, args.port)
    client.set_timeout(10.0)  # 设置超时
    world = client.get_world()  # 获取世界对象

    settings = world.get_settings()
    settings.synchronous_mode = True
    settings.fixed_delta_seconds = 0.05
    world.apply_settings(settings)
    # 红绿灯的组内id和OpenDriveID不是一一对应的,组内id会发生变化

    # 获取所有红绿灯(15个)
    traffic_lights = world.get_actors().filter('traffic.traffic_light')
    # print(len(traffic_lights))
    # # 打印红绿灯的位置
    # for traffic_light in traffic_lights:
    #     transform = traffic_light.get_transform()
    #     world.debug.draw_string(transform.location, str(traffic_light.get_opendrive_id())
    #     , life_time=6000, color=carla.Color(255, 0, 0))

    # 三条车道，共5组红绿灯，从右自左，自下而上分为1-5组，正方形路口最底边左边开始给红绿灯编号
    uni_ids = [[954, 953], [960, 962, 961], [952, 951, 949, 950],
               [957, 959, 958], [945, 944, 943]]

    # 传入参数格式【组号， 组内编号， 设置路灯颜色， 设置颜色时长】
    # [绿-1， 黄-2， 红-3]
    # try:
    # 对输入数据的异常处理

    try:
        # 根据参数获取opendrive_id和设置红绿灯时长group_id, in_group_id, color_id, color_time
        uni_id = uni_ids[int(group_id) - 1][int(in_group_id) - 1]
        # 遍历红绿灯找到对应路灯
        for traffic_light in traffic_lights:
            if float(traffic_light.get_opendrive_id()) == uni_id:
                # 设置路灯时长
                if float(color_id) == 1:
                    traffic_light.set_green_time(float(color_time))
                    print("已设置编号为{}的绿灯时间为{}！".format(uni_id, color_time))
                elif float(color_id) == 2:
                    traffic_light.set_yellow_time(float(color_time))
                    print("已设置编号为{}的黄灯时间为{}！".format(uni_id, color_time))
                elif float(color_id) == 3:
                    traffic_light.set_red_time(float(color_time))
                    print("已设置编号为{}的红灯时间为{}！".format(uni_id, color_time))
    except Exception as e:
        print(f"Unexpected Error: {e}")
    # tick修改红绿灯
    world.tick()

if __name__ == '__main__':
    print("组号(1~5):", end="")
    group_id = input()
    print("组内编号:", end="")
    in_group_id = input()
    print("红绿灯(1~3):", end="")
    color_id = input()
    print("设置时间:", end="")
    color_time = input()
    main(group_id, in_group_id, color_id, color_time)
