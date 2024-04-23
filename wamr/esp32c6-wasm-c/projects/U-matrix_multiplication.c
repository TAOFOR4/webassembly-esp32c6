#include <stdio.h>

#define N 10

void multiply_matrices(int first[N][N], int second[N][N], int result[N][N])
{
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

void display_matrix(int matrix[N][N])
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

int main()
{
    int first[N][N] = {{1, 2}, {3, 4}}; // Simplified initialization for brevity
    int second[N][N] = {{1, 2}, {3, 4}};
    int result[N][N]; // To store result

    multiply_matrices(first, second, result);
    display_matrix(result);

    return 0;
}
