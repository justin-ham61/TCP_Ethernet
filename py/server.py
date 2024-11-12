import socket

HOST = '192.168.0.101'
PORT = 59293

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print(f"Connected by {addr}")
        while True:
            data = conn.rect(1024)
            if not data:
                break
            conn.sendall(data)