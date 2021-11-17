#include <cstdio>
__global__ void printHelloGPU()
{
	printf("Hello x: #%d  y: #%d\n", threadIdx.x, threadIdx.y);
}
int main()
{
    // threads organizadas em modo 2D dentro do bloco
	//dim3 threads(3,3);
	// 1 bloco com 3x3 threads
	printHelloGPU<<<1, 3>>>();
	cudaDeviceSynchronize();
	return 0;
}
