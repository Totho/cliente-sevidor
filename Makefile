#This is a variable
CC=g++
ZMQ=/home/utp/cs/HaloCS/zmq
ZMQ_HDRS=$(ZMQ)/include
ZMQ_LIBS=$(ZMQ)/lib

#regla principal
all: cliente server

cliente: cliente.c
	$(CC) -std=c++11 -I/home/utp/cs/HaloCS/zmq/include -c  cliente.c -lzmq -lczmq
	$(CC) -std=c++11 -L/home/utp/cs/HaloCS/zmq/lib -o cliente  cliente.o -lzmq -lczmq


server: server.c
	$(CC) -std=c++11 -I/home/utp/cs/HaloCS/zmq/include -c  server.c -lzmq
	$(CC) -std=c++11 -L/home/utp/cs/HaloCS/zmq/lib -o server  server.o -lzmq
	
clean:
	rm -f cliente.o server.o cliente server *~
 
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/utp/csHaloCS/zmq/lib
