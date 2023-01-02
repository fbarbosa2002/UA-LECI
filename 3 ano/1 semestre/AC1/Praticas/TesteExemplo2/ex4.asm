# typedef struct		      Align    Size   Offset
#{
#	int acc;			4	4	0	0-3
#	unsigned char nm;		1	1	4	4(5-6-7)
#	double grade;			8	8	8	8-15
#	char quest[14];			1	14	16	16-29(30-31)
#	int cq;				4	4	32	32-35(36-37-38-39)
#} t_kvd;				8	40


#double func4(int nv,t_kvd *pt)
#{
#	int i,j ;
#	double sum= 0.0 ;

#	for(i=0 ; i < nv ; i ++; pt ++) {
#		j = 0 ;
#		do{
#			sum += (double) pt->quest[j] ;
#			j++ ; 
#		} while(j< pt ->num) ; 

#		pt->acc = (int) (sum / pt->grade) ;
#	}	
#	return (pt->grade x* (double) pt->cq) ;
#}