

#include<stdio.h>
// Codigo a ser executado na GPU
__global__  void add(int a, int b, int * c)
{
*c = a+b; 
}


int main()
{
    int c;
    int *dev_c;
    int a,b;
    scanf(" %d %d",&a,&b);
    // aloca memoria na GPU
    cudaMalloc((void**)&dev_c,sizeof(int));
    //chama o Kernel add (de forma assincrona). Chama  1 bloco com uma thread.
	add<<<1,1>>>(a,b,dev_c);
    // copia o resultado de volta para o host
    cudaMemcpy(&c,dev_c,sizeof(int),cudaMemcpyDeviceToHost);
    printf("resultado da soma %d\n", c);
	return 0;
}
