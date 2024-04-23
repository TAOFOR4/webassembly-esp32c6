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

int main()
{
    int result = fib(6); // Change this number based on your test needs
    printf("The result is %d", result);

    return 0;
}