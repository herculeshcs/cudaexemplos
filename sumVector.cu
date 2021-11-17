#include<stdio.h>

__global__ void VecAdd(float* A, float* B, float* C){
int i = threadIdx.x;
   if(i<5){C[i] = A[i] + B[i];}}
int main() {
 int n = 5;
 size_t size = n * sizeof(float);
 float *d_A, *d_B, *d_C;
 cudaMalloc((void**)&d_A, size);
 cudaMalloc((void**)&d_B, size);
 cudaMalloc((void**)&d_C, size);
 float h_A[] = {1,2,3,4,5};
 float h_B[] = {10,20,30,40,50};
 float h_C[] = {0,0,0,0,0};
 cudaMemcpy(d_A,h_A,size,cudaMemcpyHostToDevice);
 cudaMemcpy(d_B,h_B,size,cudaMemcpyHostToDevice);
 int nThreadsPerBlock = 256;
 //int nBlocks = n / nThreadsPerBlock;
 VecAdd<<<1, nThreadsPerBlock>>>(d_A, d_B, d_C);
 cudaMemcpy(h_C,d_C,size,cudaMemcpyDeviceToHost);
 for(int i =0;i<n;i++){printf("%f \n",h_C[i]);}
 cudaFree(d_A); cudaFree(d_B); cudaFree(d_C);
}
