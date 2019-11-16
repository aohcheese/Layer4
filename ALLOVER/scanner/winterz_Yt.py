#first import all req module
import socket
from datetime import datetime
import threading
from queue import Queue

#it is use for prevent dupelicate entries from shared variable
print_lock = threading.Lock()

#credit
print(" ██╗   ██╗ ██████╗ ██╗   ██╗██████╗          ██████╗ ███████╗███████╗██╗     ██╗███╗   ██╗███████╗")
print("  ██╗ ██╔╝██╔═══██╗██║   ██║██╔══██╗        ██╔═══██╗██╔════╝██╔════╝██║     ██║████╗  ██║██╔════╝")
print("  ╚████╔╝ ██║   ██║██║   ██║██████╔╝        ██║   ██║█████╗  █████╗  ██║     ██║██╔██╗ ██║█████╗ ")
print("   ╚██╔╝  ██║   ██║██║   ██║██╔══██╗        ██║   ██║██╔══╝  ██╔══╝  ██║     ██║██║╚██╗██║██╔══╝   ") 
print("    ██║   ╚██████╔╝╚██████╔╝██║  ██║███████╗╚██████╔╝██║     ██║     ███████╗██║██║ ╚████║███████ ")
print("    ╚═╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝     ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝")
print("               Port Scanner  ")
#Enter Host To Scan
host = input("Enter IP or Website To Scan : ")
ip = socket.gethostbyname(host) #translate a host name to ipv4 address format

#these Three line are just added for look & feel
print("-" * 80)
print("              Please Wait, Scanning The Host ---------> ", ip)
print("-" * 80)

# starting time
t1 = datetime.now()

#not write the code for port scanning
def scan(port):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # it create sock stream
        result = sock.connect_ex((ip,port))
        if result == 0:
            #if a socket is listening it will print out the port number
            print("\n Port %d Is OPEN ------->" %(port))
            sock.close()

    except:
        pass

#create threader function
def threader():
    while True:
        worker = q.get() # get an worker from the queue
        scan(worker) #scan is a function & it run the job with avaliable worker in queue
        q.task_done() #complete with the job

#create a queue by
q = Queue()

#writing for loop for number of thread to allow
for x in range(99):
    t = threading.Thread(target=threader)
    t.daemon=True
    t.start()

for worker in range(1,65535): # you can scan all ports 1 to 65535 just takes time
    q.put(worker)

#thread will join after thread termination
q.join()

































#calculate end of exec time
t2 = datetime.now()
#calculate the difference
total = t2 - t1
#print the difference
print("Total Scanning Time : ",total)
            