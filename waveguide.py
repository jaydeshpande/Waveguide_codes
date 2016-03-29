#import libraries 
import numpy as np
import scipy as sc
import math
import pandas as pd
import csv
from scipy.integrate import quad
from scipy.integrate import odeint
import matplotlib.pyplot as mplt
# initialization of libraries
print "numpy version:"
print np.__version__
print "scipy version:"
print sc.__version__
print "pandas version"
print pd.__version__
pi=math.pi
#definition of integrand function 
def integrand(theta,l,t,w,i0,alpha):
	mult=(i0/(pi*t*alpha))
	il=mult*np.sin(theta)*(1-math.exp(-alpha*l/np.sin(theta)))
	return il
#initialization of variables 
l=1
w=1
t=0.1
i0=1000
alpha=1
#calculation of the direct radiation received at the ends of the waveguide
il=quad(integrand, 0, pi/2, args=(l,t,w,i0,alpha))
#calculation of direct radiation on one side of the receiver complete 
i=0
nmax=100
#calculating effect of thickness
x=[]
x1=[]
tmax=0.01
t=0.001
for i in range(0,nmax):
	il=quad(integrand, 0, pi/2, args=(l,t,w,i0,alpha))
	x.append([t,il[0]])
	rad=t*il[0]
	x1.append([t,rad])
	t=t+(tmax/nmax)
mplt.figure(1)
mplt.subplot(211)
mplt.plot([row[0] for row in x], [row[1] for row in x], 'k', linewidth=2.0)
mplt.ylabel('Direct Radiation Intensity, \'IL\' (W/m2)')
mplt.title('IL vs t')
mplt.subplot(212)
mplt.plot([row[0] for row in x1], [row[1] for row in x1], 'k', linewidth=2.0)
mplt.ylabel('Direct Radiative Power, \'IL0\' (W)')
#calculating effect of length
x2=[]
x3=[]
t=0.005
lmax=5
l=0.01
nmax=100
for j in range(0,nmax):
	il=quad(integrand, 0, pi/2, args=(l,t,w,i0,alpha))
	x2.append([l,il[0]])
	rad=t*il[0]
	x3.append([l,rad])
	l=l+0.05
mplt.figure(2)
mplt.subplot(211)
mplt.plot([row[0] for row in x2], [row[1] for row in x2], 'k', linewidth=2.0)
mplt.ylabel('Direct Radiation Intensity, \'IL\' (W/m2)')
mplt.title('I vs L')
mplt.subplot(212)
mplt.plot([row[0] for row in x3], [row[1] for row in x3], 'k', linewidth=2.0)
mplt.xlabel('Waveguide Length, \'t\' (m)')
mplt.ylabel('Direct Radiative Power, \'IL0\' (W)')
#calculating effect of alpha
x4=[]
x5=[]
t=0.005
l=1
nmax=20000
alpha=0.001
for j in range(0,nmax):
	il=quad(integrand, 0, pi/2, args=(l,t,w,i0,alpha))
	x4.append([alpha,il[0]])
	rad=t*il[0]
	x5.append([alpha,rad])
	alpha=alpha+0.001
mplt.figure(3)
mplt.subplot(211)
mplt.plot([row[0] for row in x4], [row[1] for row in x4], 'k', linewidth=2.0)
mplt.ylabel('Direct Radiation Intensity, \'IL\' (W/m2)')
mplt.title('I vs alpha')
mplt.subplot(212)
mplt.plot([row[0] for row in x5], [row[1] for row in x5], 'k', linewidth=2.0)
mplt.xlabel('Absorptivity \'t\' (m-1)')
mplt.ylabel('Direct Radiative Power, \'IL0\' (W)')
mplt.show()
np.savetxt("analytical absorptivity.txt", x5, delimiter=",")