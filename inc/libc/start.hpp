#pragma once

#ifdef BareMetal

extern const int argc;
extern const char *argv[];

/// @brief bare metal entry
extern "C" void _start(void) __attribute__((section(".start")));

/// @brief program entry point
extern "C" int main(int argc, const char *argv[]);

#endif  // BareMetal
