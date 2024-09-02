#include <stdio.h>

#define INPUT_NODES 3
#define HIDDEN_NODES 4
#define OUTPUT_NODES 2

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

// Function to apply ReLU activation to a layer
void apply_relu(double layer[], int size)
{
    for (int i = 0; i < size; i++)
    {
        layer[i] = relu(layer[i]);
    }
}

// Function to apply linear activation to a layer
void apply_linear(double layer[], int size)
{
    for (int i = 0; i < size; i++)
    {
        layer[i] = linear(layer[i]);
    }
}

// Function to perform forward propagation through the neural network
void forward_propagation()
{
    // Input data (single example with 3 features)
    double input[INPUT_NODES] = {1.0, 0.5, -1.5};

    // Predefined weights for input to hidden layer
    double weights_input_hidden[INPUT_NODES * HIDDEN_NODES] = {
        0.2, -0.3, 0.4, 0.1,
        -0.5, 0.2, -0.1, 0.4,
        0.3, 0.7, -0.2, 0.6};

    // Predefined weights for hidden to output layer
    double weights_hidden_output[HIDDEN_NODES * OUTPUT_NODES] = {
        -0.4, 0.1,
        0.2, -0.5,
        0.3, 0.3,
        -0.2, 0.4};

    // Allocate memory for hidden layer and output layer
    double hidden[HIDDEN_NODES];
    double output[OUTPUT_NODES];

    // Input to hidden layer
    matmul(input, weights_input_hidden, hidden, 1, INPUT_NODES, HIDDEN_NODES);
    apply_relu(hidden, HIDDEN_NODES);

    // Hidden to output layer
    matmul(hidden, weights_hidden_output, output, 1, HIDDEN_NODES, OUTPUT_NODES);
    apply_linear(output, OUTPUT_NODES);
}

int main()
{
    forward_propagation();
    return 0;
}
