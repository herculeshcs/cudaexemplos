#include<stdio.h>
#include <time.h>
#include <stdlib.h>
__global__ void scalarValueMul(float * a, int n  , int  value)
{

int i = blockDim.x * blockIdx.x + threadIdx.x;

  if(i<n)
  {
      a[i]= a[i]*value;
      printf("  blockDim.x = %d   blockIdx.x = %d   threadIdx.x = %d    i (%d)  a[i] = %.2f\n",blockDim.x,blockIdx.x,threadIdx.x,i,a[i]);
  }
  

}


void init (float * v, int n)
{
int i;
srand(time(NULL));
     for(i =0;i<n;i++)
    {
            v[i]=i;
    }
}

int main (int argc, char ** argv)
{
         
   int n,value;
   scanf(" %d",&n);   
   scanf(" %d",&value);        
   float * a=(float*) malloc( sizeof(float)*n);
   float * d_a;
   init(a,n);
   cudaMalloc(&d_a, sizeof(float)*n);
   cudaMemcpy(d_a,a,sizeof(float)*n,cudaMemcpyHostToDevice);
   scalarValueMul<<<1,n>>>(d_a,n,value);
   cudaMemcpy(a, d_a, sizeof(float)*n,cudaMemcpyDeviceToHost);
        printf("\n");
        for(int i =0;i<n;i++)
        {
                printf("%.2f ",a[i]);
        }
        printf("\n");
return 0;
}