#include <stdio.h>

#define DATA_SIZE 256
#define MODULO 255

// Function to calculate modulo sum checksum
unsigned char calculate_checksum()
{
    int size = DATA_SIZE;
    unsigned char data[DATA_SIZE];
    // Initialize data for example purposes
    for (int i = 0; i < DATA_SIZE; ++i)
    {
        data[i] = i;
    }
    unsigned long sum = 0;
    for (int i = 0; i < size; ++i)
    {
        sum += data[i];
    }
    return sum % MODULO;
}
