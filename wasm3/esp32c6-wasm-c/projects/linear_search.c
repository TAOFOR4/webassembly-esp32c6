#include <stdio.h>

// Function to perform linear search
int linear_search()
{
    int arr[9] = {0, 1, 2, 3, 4, 5, 6, 7, 8};
    for (int i = 0; i < 9; i++)
    {
        if (arr[i] == 4)
        {
            return i; // Target found
        }
    }
    return -1; // Target not found
}
