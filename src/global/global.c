#include <8051.h>
#include "global.h"

#define GET_HIGH_BITS(x) ((x) >> 8)
#define GET_LOW_BITS(x) ((x) & 0x00FF)

void clear_buffer(void){
    for(int i = 0; i < buffer_size; i++){
        buffer[i] = 0;
    }
    buffer_idx = 0;
}

unsigned char buffer[29];
unsigned char buffer_idx = 0;
unsigned char buffer_size = 29;
unsigned char mode = 0;
unsigned char invalid_cmd_flag = 0;
unsigned char last_polling_mode = 0;
unsigned char ping_enable = 0;
unsigned char inactivity_counter = 0;
unsigned char rtu = 0;


int rw_ptr;
int rw_size;
