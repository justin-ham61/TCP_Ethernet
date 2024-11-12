#ifndef GLOBAL_H
#define GLOBAL_H

#define GET_HIGH_BITS(x) ((x) >> 8)
#define GET_LOW_BITS(x) ((x) & 0x00FF)

#define DUAL_POLLING_MODE 0
#define TCP_POLLING_MODE 1
#define CONFIG_CHANGE_MODE 2

extern void clear_buffer(void);

extern unsigned char buffer[29];
extern unsigned char buffer_idx;
extern unsigned char buffer_size;
extern unsigned char mode;
extern unsigned char invalid_cmd_flag;
extern unsigned char last_polling_mode;
extern unsigned char ping_enable;
extern unsigned char inactivity_counter;
extern unsigned char rtu;

extern int rw_ptr;
extern int rw_size;

#endif