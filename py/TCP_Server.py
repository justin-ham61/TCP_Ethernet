import socket

# Server configuration
HOST = '192.168.0.101'  # IP address to bind to
PORT = 59295            # Port to listen on

# Create a socket object
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the specified host and port
server_socket.bind((HOST, PORT))

# Start listening for incoming connections (with a queue of 5)
server_socket.listen(5)

print(f"Server listening on {HOST}:{PORT}...")

# Accept incoming connections
while True:
    # Wait for a connection
    client_socket, client_address = server_socket.accept()
    print(f"Connection from {client_address} has been established.")

    # Receive data from the client (optional, can be used to handle further communication)
    data = client_socket.recv(1024)  # Buffer size of 1024 bytes
    if data:
        print(f"Received from client: {data.decode('utf-8')}")
    
    # Close the client socket after the communication is done
    client_socket.close()
    print(f"Connection with {client_address} closed.")