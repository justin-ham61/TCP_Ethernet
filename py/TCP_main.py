import socket
import threading
import time

# Server function
def run_server():
    TCP_IP = '192.168.0.101'  # Localhost
    TCP_PORT = 59293
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)  # Allow reuse of the port
    server_socket.bind((TCP_IP, TCP_PORT))
    server_socket.listen(1)
    print(f"Server listening on {TCP_IP}:{TCP_PORT}...")

    while True:
        try:
            # Accept incoming client connections
            conn, addr = server_socket.accept()
            print(f"Connection from {addr}")

            # Receive data from the client
            data = conn.recv(1024)
            if not data:
                print("No data received, closing connection.")
                break  # If no data is received, break out of the loop
            print(f"Received data: {data.decode()}")

            # Send a response back to the client
            conn.sendall(b"Hello from server")

            # Close the connection after handling the client
            conn.close()

        except Exception as e:
            print(f"Error: {e}")
            continue  # Continue listening for new connections on error

    # Clean up: Close the server socket when done (although this won't be reached in an infinite loop)
    server_socket.close()

# Client function to send a message every 5 seconds
def run_client():
    TCP_IP = '192.168.0.102'  # Server IP
    TCP_PORT = 59293
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    try:
        client_socket.connect((TCP_IP, TCP_PORT))
        print("Client connected to the server.")
        
        # Send a message every 5 seconds
        while True:
            message = ":<3hello>"
            print(f"Sending message: {message}")
            client_socket.sendall(message.encode())  # Send the message
            
            # Wait for the server response
            data = client_socket.recv(1024)
            print(f"Received from server: {data.decode()}")

            # Wait for 5 seconds before sending the next message
            time.sleep(5)

    except Exception as e:
        print(f"Error in client: {e}")
    finally:
        client_socket.close()

# Create threads for server and client
server_thread = threading.Thread(target=run_server)
client_thread = threading.Thread(target=run_client)

# Start the server thread
server_thread.start()

# Start the client thread
client_thread.start()

# Wait for threads to finish
client_thread.join()
server_thread.join()