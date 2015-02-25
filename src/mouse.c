#include "minicom.h"
#include <stdio.h>
#include <linux/input.h>
#include <fcntl.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/stat.h>



void send_mouse(void)
{
	vt_send(68);
}

void  read_mouse(void)
{
    int fd, retval;
    char buf[6];
    fd_set readfds;
    struct timeval tv;

    //fd = open("/dev/input/mice", O_RDONLY);
    if(( fd = open("/dev/input/mice", O_RDONLY))<0)
    {
        printf("Failed to open \"/dev/input/mice\".\n");
        exit(1);
    }
    else
    {
        printf("open \"/dev/input/mice\" successfuly.\n");
    }

    while(1)
    {
        tv.tv_sec = 5;
        tv.tv_usec = 0;

        FD_ZERO(&readfds);
        FD_SET(fd, &readfds);

        retval = select(fd+1, &readfds, NULL, NULL, &tv);

        if(FD_ISSET(fd,&readfds))
        {
            if(read(fd, buf, 6) <= 0)//终端设备，一次只能读取一行
            {
                continue;
            }
            printf("Button type = %d, X = %d, Y = %d, Z = %d\n", (buf[0] & 0x07), buf[1], buf[2],   buf[3]);
            char temp = 0;
            temp = buf[0] & 0x07;
            write(portfd, &temp, 1);
        }
    }
    close(fd);
}
