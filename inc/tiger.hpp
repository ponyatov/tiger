/// @file
/// @brief trans-compiled code sample (API headers)

#pragma once

#ifndef BareMetal
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#else
// #include <libc/libc.hpp>
#endif  // BareMetal

/// @defgroup main main
/// @{

#ifndef BareMetal
/// @brief program entry point
extern "C" int main(int argc, const char *argv[]);
#endif  // BareMetal

/// @brief print command line argument
extern "C" void arg(int argc, const char argv[]);

/// @}
