from http import client
import socket
import threading

IP = '127.0.0.1'
PORT = 9998

#大模型import argparse
import sys
sys.path.append('..')
from codeassist import WizardCoder


def main():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((IP, PORT))
    server.listen(5)
    print(f'[*] Listening on {IP}:{PORT}')
    #加载模型
    model = WizardCoder(model_name_or_path="WizardLM/WizardCoder-15B-V1.0", peft_name="./outputs-finetuned-wizardcoder/")
    print("模型加载完毕")
    while True:
        client, address = server.accept()
        print(f'[*] Acceped connection from {address[0]}:{address[1]}')
        request = client.recv(1024)
        print(f'[*] Received: {request.decode("utf-8")}')
        prompt=request.decode("utf-8")
        outputs = model.generate(prompt)
        print(outputs[0])
        #client.send(b'Hello')
        client.send(outputs[0].encode('utf-8'))
        #client_handler = threading.Thread(
            #target=handle_client, args=(client,))
        #client_handler.start()
        


def handle_client(client_socket):
    with client_socket as sock:
        request = sock.recv(1024)
        print(f'[*] Received: {request.decode("utf-8")}')
        sock.send(b'Hello')


if __name__ == '__main__':
    main()

