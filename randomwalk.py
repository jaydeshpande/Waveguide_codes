# random walk modeling for 1 D waveguide
import numpy as np
import math
import matplotlib.pyplot as plt
colours=['blue','black','coral','crimson','darkgray','green','violet']
l=5
t=0.05
pi=math.pi
nmax=10000
amax=59
il=[]
alpha1=0.01
alpha=np.exp(-alpha1)
for j in range (0,amax):
	hits = []
	il1 = []
	il2 = []
	for i in range(0, nmax):
		loc=l*np.random.rand()
		firsthitflag=1
		pathlength=0
		absorb=0
		while loc<=l and loc>=0:
			if np.random.rand()<absorb and firsthitflag>1:
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
				oldloc=loc
				loc=loc+(size*step*np.random.rand())
				if loc<0:
					il1.append([i,0])
				if loc>l:
					il2.append([i,l])
				pathlength=pathlength+abs(loc-oldloc)
				lengthcomp=np.exp(pathlength)
				absorb=alpha*lengthcomp
				firsthitflag=firsthitflag+1
	ilavg=(l*1000./nmax)*(len(il1)+len(il2))/2
	alphainv=1/alpha1
	il.append([alphainv,ilavg])
	alpha1=alpha1+0.3
	alpha=np.exp(-alpha1)
	del il1[:]
	del il2[:]
plt.plot([row[0] for row in il], [row[1] for row in il], 'k', linewidth=2.0)
plt.xlabel('Alpha')
plt.ylabel('Direct Radiative Power, \'IL0\' (W)')
plt.title('I vs alpha')
plt.axis([0,10,0,1800])
plt.show()
np.savetxt("absorptivity_data.txt", il, delimiter=",")
