
//  Hello World server

#include <zmq.h>
#include <stdio.h>
#include <unistd.h>
#include <string>
#include <assert.h>
#include <iostream>

using namespace std;

int op(char b[6]){
       string a,c;
       int flag=0;
       for(int i=0; i<(sizeof(b)/sizeof(*b));i++){
               if(b[i]=='+')
                flag=1;
               if(b[i]!='+' and flag==0)
               a.push_back(b[i]);
               else c.push_back(b[i]);
       }
       //atoi( str.c_str() )
       cout<<a<<" "<<c<<endl;
       return atoi(a.c_str()) + atoi(c.c_str());
}


int main (void)
{
    //  Socket to talk to clients
    string r;
    void *context = zmq_ctx_new ();// por cada agente debe haber un cntexto
    
    void *responder = zmq_socket (context, ZMQ_REP);// REP de replay---- responder es el nombre del socket
    
    int rc = zmq_bind (responder, "tcp://*:5555");// bind  crea local el socket
    
    assert (rc == 0);// aborta si es 0

    while (1) {				// se queda en un ciclo infinito esperando algo
        char buffer [6];
        zmq_recv (responder, buffer, 6, 0);
        buffer[6] = '\0';
        
        printf ("Received Hola compita %s\n", buffer);
        sleep (1);          //  Do some 'work'
        r=to_string(op(buffer));
        cout<<r<<endl;
        zmq_send (responder, &r, 5, 0);
    }
    return 0;
}
