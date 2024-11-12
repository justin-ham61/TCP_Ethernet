import socket
import threading
import time 

UDP_IP = "192.168.0.101"
UDP_PORT = 59293
UDP_SEND_IP = "192.168.0.102"

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))

def listen_for_packets():
    while True:
        # Receive data from the socket
        data, addr = sock.recvfrom(1024)  # Buffer size is 1024 bytes
        print(f"Received message: {data.decode('utf-8')} from {addr}")

def send_packet():
    while True:
        message = 'm'
        sock.sendto(message.encode('utf-8'), (UDP_SEND_IP, UDP_PORT))
        print(f"Sent message: {message} to {UDP_SEND_IP}:{UDP_PORT}")
        time.sleep(30)

listener_thread = threading.Thread(target=listen_for_packets)
listener_thread.daemon = True
listener_thread.start()

send_packet()