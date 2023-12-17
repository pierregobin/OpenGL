#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#define N 10000

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
    printf("d_a = %p\n", (void **) &d_a);
    cudaMalloc((void **) & d_b, sizeof(float)*N);
    printf("d_b = %p\n", (void **) &d_b);
    cudaMalloc((void **) & d_out, sizeof(float)*N);
    printf("d_out = %p\n", (void **) &d_out);

    cudaMemcpy(d_a,a,sizeof(float)*N, cudaMemcpyHostToDevice);
    printf("a -> d_a\n");
    cudaMemcpy(d_b,b,sizeof(float)*N, cudaMemcpyHostToDevice);
    printf("b -> d_b\n");
    // Main function
    vector_add<<<1,1>>> (d_out, d_a, d_b, N);
    cudaMemcpy(out,d_out,sizeof(float)*N, cudaMemcpyDeviceToHost);
    printf("d_out -> out\n");
    int i = rand() %N;
    printf("out[%d]=%f\n",i,out[i]);
    assert(out[i] == 3);
}
