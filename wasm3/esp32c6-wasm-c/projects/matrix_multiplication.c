#include <stdio.h>

#define N 10

void multiply_matrices()
{
    int first[N][N] = {{1, 2}, {3, 4}}; // Simplified initialization for brevity
    int second[N][N] = {{1, 2}, {3, 4}};
    int result[N][N]; // To store result
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            result[i][j] = 0;
            for (int k = 0; k < N; k++)
            {
                result[i][j] += first[i][k] * second[k][j];
            }
        }
    }
}
