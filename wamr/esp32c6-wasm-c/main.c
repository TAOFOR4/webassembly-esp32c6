#include <stdbool.h>
#include <string.h>
#include <stdio.h>

#define MAX_PRIME 100

void sieve_of_eratosthenes(int max_limit)
{
    bool prime[max_limit + 1];
    memset(prime, true, sizeof(prime));

    for (int p = 2; p * p <= max_limit; p++)
    {
        // If prime[p] is not changed, then it is a prime
        if (prime[p] == true)
        {
            // Update all multiples of p
            for (int i = p * p; i <= max_limit; i += p)
                prime[i] = false;
        }
    }

    // Printing all prime numbers
    for (int p = 2; p <= max_limit; p++)
        if (prime[p])
            printf("prime number: %d \n", p);
}

int main()
{
    sieve_of_eratosthenes(MAX_PRIME);
    return 0;
}
