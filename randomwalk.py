# random walk modeling for 1 D waveguide
import numpy as np
import scipy as sc
from scipy import interpolate
import math
import matplotlib.pyplot as plt
l=1
t=0.001
pi=math.pi
nmax=20000
amax=11
il=[]
alpha=0.01
for j in range (0,amax):
	hits = []
	il1 = []
	il2 = []
	for i in range(0, nmax):
		loc=l*np.random.rand()
		while loc<=l and loc>=0:
			if np.random.rand()<alpha:
				hits.append([i,loc])
				break
			else:
				theta=pi*np.random.rand()
				size=t*np.tan(theta)
				step=np.random.randint(0,1)
				if step==0:
					step=-1
				else:
					step=1
				loc=loc+(size*step*np.random.rand())
				if loc<0:
					il1.append([i,0])
				if loc>l:
					il2.append([i,l])
	ilavg=(l*1000./nmax)*(len(il1)+len(il2))/2
	il.append([t,ilavg])
	t=t+0.001
	del il1[:]
	del il2[:]
plt.plot([row[0] for row in il], [row[1] for row in il], 'k', linewidth=2.0)
plt.xlabel('Thickness (m)')
plt.ylabel('Direct Radiative Power, \'IL0\' (W)')
plt.title('I vs L')
plt.show()
np.savetxt("thickness_data.txt", il, delimiter=",")