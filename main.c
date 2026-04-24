#include "stdio.h"

extern float rho(float h);
extern float fdrag(float h,float v,float Cd,float A);
extern float compute(float *h,float *v, float dt,float mass, float Cd,float A);
int main(){
  float h=100000.0;
  float v=0.0;
  float dt=0.1;
  float mass=0.5;
  float Cd=1.0;
  float A=0.000001;
  const float FinalV=compute(&h,&v,dt,mass,Cd,A);
  printf("Compute done...\n");
  printf("The Needle's Terminal Speed is %.2f m/s\n",FinalV);

  return 0;

}