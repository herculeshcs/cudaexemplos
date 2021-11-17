#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define NRA 3000                 /* number of rows in matrix A */
#define NCA 3000                 /* number of columns in matrix A */
#define NCB 3000  
int main()
{

  double a[NRA][NCA], b[NCA][NCB], c[NRA][NCB];
int i,j,k;

srand(time(NULL));

  for(i =0;i<NRA;i++){
      for(j=0;j<NCA;j++){
          a[i][j]=rand()%2000;
          }  }

   for(i =0;i<NCA;i++){
      for(j=0;j<NCB;j++){
          b[i][j]= rand()%2000;}}

          for(i =0;i<NRA;i++)
              for(j=0;j<NCB;j++)
              {c[i][j]=0;}
  
  for (i =0;i<NRA;i++)
      for(j=0;j<NCB;j++)
        for(k=0;k<NCA;k++){
            c[i][j]+= a[i][k]*b[k][j];
        }
        
        
          /*for(i =0;i<NRA;i++)
          {
              for(j=0;j<NCB;j++)
              {
                  printf(" %.2f ",c[i][j]);
                  
            }
            printf("\n");
        }
*/
  return 0;
}
