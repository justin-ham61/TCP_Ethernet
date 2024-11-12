import curses
import time
import socket
import datetime
import select
import random
import string 

LOG_FILE = 'ping_time.log'
HOST_IP = '192.168.0.101'
UDP_PORT = 59293
TCP_PORT = 59294
SERVER_IP = '192.168.0.102'
timeout = 5
start_time = 0
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((HOST_IP, UDP_PORT))

def generate_random_string():
    number = random.randint(0, 9) 
    length = random.randint(8, 16)
    random_string = ''.join(random.choices(string.ascii_lowercase, k=length))
    result = f":<{number}{random_string}>"
    return result

def check_condition(random_string, transform_string):
    transformed_random = random_string.replace('<', '[').replace('>', ']')
    transformed_random = transformed_random.upper()
    trlen = len(transformed_random)
    tslen = len(transform_string)
    transformed_random = transformed_random[0:2] + transformed_random[3:trlen]
    transform_string = transform_string[0:2] + transform_string[3:tslen]
    return transformed_random == transform_string

def main(stdscr):
    sent = 0
    received = 0
    errors = 0
    last_message = ""
    message_received = ""
    current_mode = "UDP"
    ping_enable = False
    ping_count = 0
    ping_times = []
    report = 0

    # Clear screen
    stdscr.clear()

    # Turn off cursor and enable keypad
    curses.curs_set(0)
    curses.init_pair(1, curses.COLOR_YELLOW, curses.COLOR_BLACK)
    curses.init_pair(2, curses.COLOR_RED, curses.COLOR_BLACK)
    curses.init_pair(3, curses.COLOR_CYAN, curses.COLOR_BLACK)
    # Get screen height and width

    # Loop to display information
    while True:
        # Clear the screen and refresh to prevent old data from being displayed
        stdscr.clear()
        
        # Display title and information
        stdscr.addstr(1, 0, "Information Display", curses.A_BOLD)
        stdscr.addstr(2, 0, f"Packet sent: {sent}")
        stdscr.addstr(3, 0, f"Packet received: {received}")
        stdscr.addstr(4, 0, f"Errors: {errors}", curses.color_pair(2))
        stdscr.addstr(5, 0, f"Message Sent: {last_message}")
        stdscr.addstr(6, 0, f"Message Received: {message_received}")
        stdscr.addstr(7, 0, f"Mode: {current_mode}", curses.color_pair(1))
        stdscr.addstr(8, 0, f"Current ping count: {ping_count}")
        stdscr.addstr(9, 0, f"Ping enable: {ping_enable}")
        if ping_enable == False:
            stdscr.addstr(10, 0, "Press p to ping device")
        else: 
            stdscr.addstr(10, 0, "Press n to stop ping mode", curses.color_pair(3))
        stdscr.addstr(11, 0, "Pressed r to create a report")
        stdscr.addstr(12, 0, "Press s to send a packet in current mode")
        stdscr.addstr(13, 0, "Press m to toggle modes")
        stdscr.addstr(14, 0, "Press q to quit")

        

        # Refresh the screen to update the content
        stdscr.refresh()
        # Wait for 1 second before updating
        if ping_enable:
            if current_mode == "TCP":
                try:
                    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    client_socket.setblocking(0)

                    #attempt at pinging
                    ping_count += 1
                    try:
                        client_socket.connect((SERVER_IP, TCP_PORT))
                    except BlockingIOError:
                        print("Non-blocking connect, waiting for connection...")

                    timeout = 1  # Timeout in seconds
                    start_time = time.time()

                    while True:
                        _, writable, _ = select.select([client_socket], [client_socket], [], timeout)
                        if writable:
                            print("Successfully connected to the server!")
                            message = generate_random_string()
                            client_socket.send(message.encode('utf-8'))
                            sent += 1
                            last_message = message
                            start_time = time.time()
                            ping_start_time = start_time
                            while True:
                                readable, _, _ = select.select([client_socket], [], [], timeout)
                                if readable:
                                    response = client_socket.recv(1024)      
                                    if response:
                                        ping_end_time = time.time();
                                        ping_time = (ping_end_time - ping_start_time) * 1000
                                        ping_times.append(ping_time)
                                        with open(LOG_FILE, 'a') as log_file:
                                            log_file.write(f"{ping_time:.2f} ms\n")
                                        print(response.decode('utf-8'))
                                        message_received = response.decode('utf-8')
                                        received += 1
                                        break
                                    else:
                                        errors += 1
                                        break

                                elif time.time() - start_time > timeout:
                                    print("Timed out while waiting for a response")
                                    with open(LOG_FILE, 'a') as log_file:
                                        log_file.write("Timed out while waiting for response\n")
                                    errors += 1
                                    break
                                else:
                                    print("waiting for response")
                            break
                        elif time.time() - start_time > timeout:
                            with open(LOG_FILE, 'a') as log_file:
                                        log_file.write("Timed out while waiting for response\r") 
                            errors += 1
                            break
                        else:
                            print("Waiting for connection...")
                finally:
                    client_socket.close()
            
            elif current_mode == "UDP":
                ping_count+=1
                message = generate_random_string()
                sock.sendto(message.encode('utf-8'), (SERVER_IP, UDP_PORT))
                last_message = message
                start_time = time.time()

                sock.settimeout(.2)
                sent+=1

                try:
                    data, addr = sock.recvfrom(1024)
                    end_time = time.time()
                    message_received = data.decode('utf-8')
                    ping_received = 1
                    if(check_condition(last_message, message_received)):
                        ping_time = (end_time - start_time) * 1000
                        ping_times.append(ping_time)
                        with open(LOG_FILE, 'a') as log_file:
                            log_file.write(f"{ping_time:.2f} ms\n")
                        received += 1 
                    else: 
                        with open(LOG_FILE, 'a') as log_file:
                            log_file.write("Incorrect message receive\n")
                        errors += 1    
                            
                except socket.timeout:
                    # If a timeout occurs (no response received within 1 second)
                    with open(LOG_FILE, 'a') as log_file:
                        log_file.write("Request Timed Out\n")
                    errors += 1

        # Check for user input to quit
        key = stdscr.getch()

        if key == ord('s'):
            if current_mode == "TCP":
                try:
                    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    client_socket.setblocking(0)
                    try:
                        client_socket.connect((SERVER_IP, TCP_PORT))
                    except BlockingIOError:
                        print("Non-blocking connect, waiting for connection...")

                    timeout = 1  # Timeout in seconds
                    start_time = time.time()
                    while True:
                        _, writable, _ = select.select([client_socket], [client_socket], [], timeout)
                        if writable:
                            print("Successfully connected to the server!")
                            message = generate_random_string()
                            client_socket.send(message.encode('utf-8'))
                            sent += 1
                            last_message = message
                            start_time = time.time()
                            while True:
                                readable, _, _ = select.select([client_socket], [], [], timeout)
                                if readable:
                                    response = client_socket.recv(1024)
                                    if response:
                                        print(response.decode('utf-8'))
                                        message_received = response.decode('utf-8')
                                        received += 1
                                        break
                                    else:
                                        break

                                elif time.time() - start_time > timeout:
                                    print("Timed out while waiting for a response")
                                    break
                                else:
                                    print("waiting for response")
                                    time.sleep(.5)
                            break
                        elif time.time() - start_time > timeout:
                            print("Connection timed out.")

                            break
                        else:
                            print("Waiting for connection...")
                            time.sleep(1)
                            
                except KeyboardInterrupt:
                        print("Client shutting down...")
                        client_socket.close()
                finally:
                    client_socket.close()
            elif current_mode == "UDP":
                message = generate_random_string()
                sock.sendto(message.encode('utf-8'), (SERVER_IP, UDP_PORT))
                last_message = message
                sent+=1
                time.sleep(.2)
                try:
                    data, addr = sock.recvfrom(1024)
                    if(data):
                        message_received = data.decode('utf-8')
                        received+=1 
                except BlockingIOError:
                    errors+=1
        
        if key == ord('p'):
            ping_enable = True
            stdscr.nodelay(True)

        #Start ping 
        if key == ord('r'):
            with open(LOG_FILE, 'w') as log_file:
                log_file.write("Ping Times (in ms)\n")
            ping_enable = True
            report = 1
            stdscr.nodelay(True)

        if key == ord('m'):
            if not ping_enable:
                if current_mode == "UDP":
                    current_mode = "TCP"
                else:
                    current_mode = "UDP"

        if key == ord('n'):
            ping_count = 0
            ping_enable = False
            stdscr.nodelay(False)

        if key == ord('q'):
            break
        
        if ping_enable == True:
            time.sleep(.02)

        if(ping_count == 100 and report == 1):
            ping_count = 0
            report = 0
            ping_enable = False
            if ping_times:
                highest_ping = max(ping_times)
                lowest_ping = min(ping_times)
                print(f"\nAfter 100 pings:")
                with open(LOG_FILE, 'a') as log_file:
                    log_file.write(f"Highest Ping Time: {highest_ping:.2f} ms\n")
                    log_file.write(f"Lowest Ping Time: {lowest_ping:.2f} ms\n")
                    log_file.write(f"# of errors: {errors}\n")
                    log_file.write(f"Average response time: {sum(ping_times)/100}")
            ping_times = []
            stdscr.nodelay(False)

# Initialize cursesq
curses.wrapper(main)