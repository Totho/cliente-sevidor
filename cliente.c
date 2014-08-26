//  Hello World client
#include <czmq.h>
#include <string>
#include <iostream>

using namespace std;

int main (int argc, char** argv)
{
    printf ("Connecting to hello world server...\n");
    zctx_t *context = zctx_new(); // nueva forma
    void *requester = zsocket_new (context, ZMQ_REQ); // nuevo
    zsocket_connect (requester, "tcp://192.68.8.156"); // nuevo

zmsg_t* request= zmsg_new(); // crear un mensaje vacio

if(argv[1] == "find")
 {
  zmsg_addstr (request, "find"); // agregrar find al mensaje request
  zmsg_addstr (request, argv[2]);

}else if(argv[1] == "add")
{
 zmsg_addstr (request, "add");
  zmsg_addstr (request, argv[2]);
  zmsg_addstr (request, argv[3]);
}else
{
cout <<"error\n";

}

// sends message request through socket requester
zmsg_send(&request, requester);
zmsg_t* resp= zmsg_recv(requester);


//printmsg(resp);

zctx_destroy(&context);

    
    return 0;
}
