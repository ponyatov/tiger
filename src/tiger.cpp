/// @file
/// @brief trans-compiled code sample (C++)

#include "tiger.hpp"

int main(int argc, const char *argv[]) {  //
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
    }
    return 0;
}

extern void arg(int argc, const char argv[]) {  //
    fprintf(stderr, "argv[%i] = <%s>\n", argc, argv);
}
