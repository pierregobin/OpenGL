#include <stdlib.h>
#include <stdio.h>

#define N 100000000

__global__ void vector_add(float *out, float *a, float *b, int n) {
    for(int i = 0; i < n; i++){
        out[i] = a[i] + b[i];
    }
}

int main(){
    float *a, *b, *out; 
    float *d_a, *d_b, *d_out;

    // Allocate memory
    if ((a = (float*)malloc(sizeof(float) * N)) == NULL) {
	    printf("a not allocated\n");
    };
    if ((b = (float*)malloc(sizeof(float) * N)) == NULL) {
	    printf("b not allocated\n");
    }
    if ((out = (float*)malloc(sizeof(float) * N)) == NULL) {
	    printf("out not allocated\n");
    };

    // Initialize array
    for(int i = 0; i < N; i++){
        a[i] = 1.0f; b[i] = 2.0f;
    }
    cudaMalloc((void **) & d_a, sizeof(float)*N);
    cudaMalloc((void **) & d_b, sizeof(float)*N);
    cudaMalloc((void **) & d_out, sizeof(float)*N);

    cudaMemcpy(d_a,a,sizeof(float)*N, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b,b,sizeof(float)*N, cudaMemcpyHostToDevice);
    // Main function
    vector_add<<<1,1>>> (d_out, d_a, d_b, N);
    cudaMemcpy(out,d_out,sizeof(float)*N, cudaMemcpyDeviceToHost);
}
