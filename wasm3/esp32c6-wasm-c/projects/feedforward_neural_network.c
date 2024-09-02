#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define INPUT_NODES 3
#define HIDDEN_NODES 4
#define OUTPUT_NODES 2

// Function to initialize matrix with random values
void initialize_matrix(double matrix[], int rows, int cols)
{
    for (int i = 0; i < rows * cols; i++)
    {
        matrix[i] = ((double)rand() / RAND_MAX) * 2 - 1; // Random values between -1 and 1
    }
}

// ReLU activation function
double relu(double x)
{
    return x > 0 ? x : 0;
}

// Linear activation function (identity function)
double linear(double x)
{
    return x;
}

// Function to perform matrix multiplication
void matmul(const double A[], const double B[], double C[], int m, int n, int p)
{
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < p; j++)
        {
            C[i * p + j] = 0;
            for (int k = 0; k < n; k++)
            {
                C[i * p + j] += A[i * n + k] * B[k * p + j];
            }
        }
    }
}

// Function to perform forward propagation
void forward_propagation(const double input[], const double weights_input_hidden[], const double weights_hidden_output[], double hidden[], double output[])
{
    // Input to hidden layer
    matmul(input, weights_input_hidden, hidden, 1, INPUT_NODES, HIDDEN_NODES);

    // Apply ReLU activation function to hidden layer
    for (int i = 0; i < HIDDEN_NODES; i++)
    {
        hidden[i] = relu(hidden[i]);
    }

    // Hidden to output layer
    matmul(hidden, weights_hidden_output, output, 1, HIDDEN_NODES, OUTPUT_NODES);

    // Apply linear activation function to output layer
    for (int i = 0; i < OUTPUT_NODES; i++)
    {
        output[i] = linear(output[i]);
    }
}

int main()
{
    srand(42); // Seed for reproducibility

    // Input data (single example with 3 features)
    double input[INPUT_NODES] = {1.0, 0.5, -1.5};

    // Initialize weights for input to hidden layer and hidden to output layer
    double weights_input_hidden[INPUT_NODES * HIDDEN_NODES];
    double weights_hidden_output[HIDDEN_NODES * OUTPUT_NODES];

    initialize_matrix(weights_input_hidden, INPUT_NODES, HIDDEN_NODES);
    initialize_matrix(weights_hidden_output, HIDDEN_NODES, OUTPUT_NODES);

    // Allocate memory for hidden layer and output layer
    double hidden[HIDDEN_NODES];
    double output[OUTPUT_NODES];

    // Perform forward propagation
    forward_propagation(input, weights_input_hidden, weights_hidden_output, hidden, output);

    return 0;
}
