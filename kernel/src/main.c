#include "uart.h"
#include "version.h"

void log(const char *message){
    while(*message != '\0'){
        serial_put(*message++);
    }
    serial_put('\n');
}

int main(int argc, char **argv) {
    log("Hello from Auser Kernel!");
    log(auser_version);
    return 0;
}
