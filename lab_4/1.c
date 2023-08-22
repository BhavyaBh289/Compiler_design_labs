#include<stdio.h>

int ack = 0,package = 0,wait_for_ack = 0,wait_for_package = 0,sendtime = 2;
int main()
{
    int i = 0;
    ack = 1;
    while (i < 10){
        sender();
        receiver();
        i++;
    }
}
void sender(){
    if (ack ==1){
        printf("sending package\n");
        ack =0;
        wait_for_package =sendtime;
    }
    else{printf("sender waiting for ack\n");
        if(wait_for_package > 0){
             wait_for_package--;
             if(wait_for_ack==0)
                 package = 1;
        }
    }
}
void receiver(){
    if (package ==1){
        printf("package received\n sending ack\n\n");
        package =0;
        wait_for_ack =sendtime;
    }
    else{
        printf("receiver waiting for package\n");
        if(wait_for_ack > 0){
             wait_for_ack--;
             if(wait_for_ack==0)
                 ack = 1;
        }
    }
}
