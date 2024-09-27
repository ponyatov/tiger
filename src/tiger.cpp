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

void arg(int argc, const char argv[]) {  //
#ifndef BareMetal
    fprintf(stderr, "argv[%i] = <%s>\n", argc, argv);
#endif  // BareMetal
}
