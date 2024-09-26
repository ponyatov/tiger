#pragma once

extern const int argc;
extern const char *argv[];

/// @brief bare metal entry 
extern "C" void _start(void);

/// @brief program entry point
extern int main(int argc, const char *argv[]);
