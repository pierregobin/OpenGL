#include <stdlib.h>
#include <stdio.h>

#define N 100000000

void vector_add(float *out, float *a, float *b, int n) {
    for(int i = 0; i < n; i++){
        out[i] = a[i] + b[i];
    }
}

int main(){
    float *a, *b, *out; 

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

    // Main function
    vector_add(out, a, b, N);
}
