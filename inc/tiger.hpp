/// @file
/// @brief trans-compiled code sample (API headers)

#pragma once

#ifndef BareMetal
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#endif  // BareMetal

/// @defgroup main main
/// @{

/// @brief program entry point
extern "C" int main(int argc, const char *argv[]);

/// @brief print command line argument
extern void arg(int argc, const char argv[]);

/// @}
