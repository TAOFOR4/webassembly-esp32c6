#include <stdio.h>

#define ARRAY_SIZE 10

// Function to perform linear search
int linear_search(int arr[], int size, int target)
{
    for (int i = 0; i < size; i++)
    {
        if (arr[i] == target)
        {
            return i; // Target found
        }
    }
    return -1; // Target not found
}

int main()
{
    int arr[ARRAY_SIZE];
    // Initialize array with some values
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        arr[i] = i;
    }

    int target = 9; // Change as needed
    int result = linear_search(arr, ARRAY_SIZE, target);

    if (result != -1)
    {
        printf("Element found at index: %d\n", result);
    }
    else
    {
        printf("Element not found\n");
    }

    return 0;
}
