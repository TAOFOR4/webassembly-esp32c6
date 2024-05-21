// fib.c - Fibonacci calculation
#include <stdio.h>
#include <stdint.h>

// Recursive Fibonacci function
int fib(int n)
{
    if (n <= 1)
        return n;
    return fib(n - 1) + fib(n - 2);
}
