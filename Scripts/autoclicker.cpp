#include <linux/uinput.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <iostream>

void emit(int fd, int type, int code, int val) {
    input_event ie;
    memset(&ie, 0, sizeof(ie));
    ie.type = type;
    ie.code = code;
    ie.value = val;
    write(fd, &ie, sizeof(ie));
}

int main() {
    int fd = open("/dev/uinput", O_WRONLY | O_NONBLOCK);
    if (fd < 0) {
        perror("open");
        return 1;
    }

    // Enable mouse button events
    ioctl(fd, UI_SET_EVBIT, EV_KEY);
    ioctl(fd, UI_SET_KEYBIT, BTN_LEFT);

    // Enable synchronization events
    ioctl(fd, UI_SET_EVBIT, EV_SYN);

    // Create virtual device
    uinput_setup usetup;
    memset(&usetup, 0, sizeof(usetup));
    snprintf(usetup.name, UINPUT_MAX_NAME_SIZE, "hyprland-mouse-clicker");
    usetup.id.bustype = BUS_USB;
    usetup.id.vendor  = 0x1;
    usetup.id.product = 0x1;
    usetup.id.version = 1;

    ioctl(fd, UI_DEV_SETUP, &usetup);
    ioctl(fd, UI_DEV_CREATE);

    sleep(2); // Let the device initialize

    // Simulate left click (press + release)
    emit(fd, EV_KEY, BTN_LEFT, 1); // press
    emit(fd, EV_SYN, SYN_REPORT, 0);
    usleep(20000);
    emit(fd, EV_KEY, BTN_LEFT, 0); // release
    emit(fd, EV_SYN, SYN_REPORT, 0);
    
    ioctl(fd, UI_DEV_DESTROY);
    close(fd);

    return 0;
}
