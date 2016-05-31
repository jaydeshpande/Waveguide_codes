#include udf.h
#define receiverarea 0.005
#define face 
#define fluid 
#define coateff 0.9
#define dir
#define volsource
DEFINE_ADJUST(adj,d)
{
	cell_t c, c1, c2;
	Thread *t, *t1, *t2, *tf;
	face_t f;
	real area, ht;
	tf = Lookup_Thread(d, face);
	begin_f_loop(f,tf)
	{
		c1=F_C0(f,tf);
		t1=THREAD_T0(tf);
		c2=F_C1(f,tf);
		t2=THREAD_T1(tf);
		F_AREA(farea,f,tf1);
		area = NV_MAG(farea);
		if (THREAD_ID(t1) == fluid)
		{
			ht=C_VOLUME(c1,t1)/area;
			C_UDMI(c1,t1,1)=dir/ht;
		}
		else if(THREAD_ID(t2) == fluid)
		{
			ht=C_VOLUME(c2,t2)/area;
			C_UDMI(c2,t2,1)=dir/ht;
		}
		else
		{
			Message("Error!");
		}		
	}
	end_f_loop(f,tf)

}

DEFINE_SOURCE(dir,c,t,ds,eqn)
{
	real source;
	source = C_UDMI(c,t,1);
	ds[eqn]=0;
	return source;
}
