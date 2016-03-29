#import libraries 
import numpy as np
import scipy as sc
import math
import time
from scipy.integrate import odeint
from scipy.integrate import quad
from scipy.integrate import quadrature
import matplotlib.pyplot as plt
global pi,h,L,k,t,alpha,msqr,m,i0
h=1
L=0.1
k=1
t=0.1
alpha=0.5
msqr=h*L*L/(k*t)
m=math.sqrt(msqr)
x=0
pi=math.pi
i0=1000
T_hat=[]
TTinf=[]
colours=['blue','black','coral','crimson','darkgray','green','violet']
def integrand1(theta):
	lstar=alpha*L/math.sin(theta)
	denominator=pi*((lstar*lstar) - msqr)
	int1=(1+math.exp(-lstar))/denominator
	return int1
def integrand2(theta,x):
	lstar=alpha*L/math.sin(theta)
	xstar=x/L
	firstterm=math.exp(-lstar*xstar)
	secondterm=math.exp(-lstar*(1-xstar))
	denominator=pi*((lstar*lstar) - msqr)
	int2=(firstterm+secondterm)/denominator
	return int2
def constant1():
	c11=(math.sinh(m/2))/(math.cosh(m/2))
	c12_2=quad(integrand1,0,pi/2)
	c12=c12_2[0]
	c13=1/msqr
	c1=c11*(c13+c12)
	return c1
def constant2():
	c22_2=quad(integrand1,0,pi/2)
	c22=c22_2[0]
	c21=1/msqr
	c2=-(c21+c22)
	return c2	
L=2.0
t=0.05
k=0.07
for p in range(0,7):
	x=0
	for i in range(0,101):
		msqr=h*L*L/(k*t)
		m=math.sqrt(msqr)
		int1=quad(integrand1,0,pi/2)
		int2=quad(integrand2,0,pi/2,args=(x,),limit=50000,epsabs=0)
		c1=constant1()
		c2=constant2()
		T1=(c1*math.sinh(m*x/L))+(c2*math.cosh(m*x/L))+(1/msqr)+int2[0]
	#	T1=-(((1/msqr)+int1[0])*multiplier)+((1/msqr)+int2[0])
		T_hat.append([x,T1])
		TTinf.append([x,i0*L*L*T1/(k*t)])
		x=x+(L/100)
	TTinf.append([2, 0])
	plt.plot([row[0] for row in TTinf], [row[1] for row in TTinf], colours[p], linewidth=2.0, label='k = %.2f [W/m.K]'%(k))
	k=k+0.01
	del T_hat[:]
	del TTinf[:]
plt.xlabel('Length, L [m]')
plt.ylabel("Non-dimensional Temperature, $T\infty$")
plt.axis([0,2.5,0,1000])
plt.legend()	
plt.show()