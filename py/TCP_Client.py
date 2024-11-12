import socket
import time

TCP_IP = "192.168.0.102"  # Server IP
TCP_PORT = 59294
LOG_FILE = 'ping_time.log'

with open(LOG_FILE, 'w') as log_file:
    log_file.write("Ping Times (in ms)\n")


i = 0
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((TCP_IP, TCP_PORT))
ping_times = []
try:
    for i in range(100):
        message = "p :<1abcdefghijklmnop>"
        client_socket.send(message.encode('utf-8'))
        start_time = time.time()
        print(f"Sent message: {message} to {TCP_IP}:{TCP_PORT}")
        
        data=client_socket.recv(1024)
        if data: 
            end_time = time.time()
            ping_time = (end_time - start_time) * 1000
            ping_times.append(ping_time)
            with open(LOG_FILE, 'a') as log_file:
                log_file.write(f"{ping_time:.2f}\n")
            print(f"Received from client: {data.decode('utf-8')}")


        time.sleep(.5)  # Send message every 10 seconds
        i += 1

    if ping_times:
        highest_ping = max(ping_times)
        lowest_ping = min(ping_times)
        print(f"\nAfter 100 pings:")
        with open(LOG_FILE, 'a') as log_file:
            log_file.write(f"Highest Ping Time: {highest_ping:.2f} ms\n")
            log_file.write(f"Lowest Ping Time: {lowest_ping:.2f} ms\n")
except KeyboardInterrupt:
    print("Client shutting down...")
finally:
    client_socket.close()