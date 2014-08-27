#Esto es un comentario


#ZMQ_PREFIX=/home/utp/Escritorio/cliente_servidor/zmq/
#ZMQ_INCLUDES=$(ZMQ_PREFIX)/include
#ZMQ_LIB=$(ZMQ_PREFIX)/lib
#CC=g++

#all: client server

#client: client.o
	#$(CC) -Wl,-rpath,$(ZMQ_LIB) -L$(ZMQ_LIB) -o client client.o -lzmq -lczmq

#server: server.o
	#$(CC) -Wl,-rpath,$(ZMQ_LIB) -L$(ZMQ_LIB) -o server server.o -lzmq -lczmq

#client.o: client.c
#	$(CC) -I$(ZMQ_INCLUDES) -c client.c

#server.o: server.c
#	$(CC) -I$(ZMQ_INCLUDES) -c server.c

#clean:
#	rm -rf client server client.o server.o

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/utp/Escritorio/cliente_servidor/zmq/lib/
#killall -9 client
#192.168.9.21
CXX=g++ -std=c++0x
ZMQ=/home/utp/Escritorio/cliente_servidor/zmq/
ZMQ_INCLUDES=$(ZMQ)/include
ZMQ_LIBS=$(ZMQ)/lib

all: client server

client: client.o
	$(CXX) -L$(ZMQ_LIBS) -o client client.o -lzmq -lczmq

client.o: client.c
	$(CXX) -I$(ZMQ_INCLUDES) -c client.c

server: server.o
	$(CXX) -L$(ZMQ_LIBS) -o server server.o -lzmq -lczmq

server.o: server.c
	$(CXX) -I$(ZMQ_INCLUDES) -c server.c


clean:
	rm -f client client.o
