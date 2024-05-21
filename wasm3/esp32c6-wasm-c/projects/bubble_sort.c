#include <stdio.h>

// Function to perform the bubble sort
void bubbleSort()
{
    int arr[7] = {64, 34, 25, 12, 22, 11, 90};
    int i, j, temp;
    for (i = 0; i < 6; i++)
        // Last i elements are already in place
        for (j = 0; j < 6 - i; j++)
            if (arr[j] > arr[j + 1])
            {
                // swap arr[j] and arr[j+1]
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
}
