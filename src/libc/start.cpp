#include "libc/start.hpp"

const char *argv[] = {"a", "b", "c"};

const int argc = 3;

void _start(void) {
    main(argc, argv);
    for (;;)
        ;
}
