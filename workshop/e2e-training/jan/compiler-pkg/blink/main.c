#include <pic18fregs.h>

#pragma config XINST=OFF

void main() {
    while (1) {
        PORTC ^= 0x01;
    }
}

