from doctest import SkipDocTestCase
import socket
from urllib import response
import argparse
import sys

target_host = "127.0.0.1"
target_port = 9998
parser = argparse.ArgumentParser()
parser.add_argument("--prompt", type=str, default="写个matlab的冒泡排序算法", help="generate code prompt")
args = parser.parse_args()

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((target_host, target_port))
client.send(args.prompt.encode('utf-8'))
response = client.recv(4096)
print(response.decode())
client.close()

