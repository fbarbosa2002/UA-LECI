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
#		} while(j< pt ->nm) ; 

#		pt->acc = (int) (sum / pt->grade) ;
#	}	
#	return (pt->grade * (double) pt->cq) ;
#}
	# Mapa de registos
	# nv: $a0 
	# pt: $a1
	# i: $t0
	# j: $t1
	# sum: $f2

	.data
sum:	.double 0.0
	.eqv 	off_acc,0
	.eqv 	off_nm,4
	.eqv	off_grade,8
	.eqv	off_quest,16
	.eqv	off_cq,32 
	.text
	.globl	main
	
main:	l.d	$f2,sum

	li	$t0,0
for:	bge	$t0,$a0,endf

	li	$t1,0

do:	addu	$t2,$t1,$a1
	lb	$t2,off_quest($t2)
	mtc1	$t2,$f4
	cvt.d.w	$f4,$f4
	
	add.d	$f2,$f2,$f4
	addiu	$t1,$t1,1

while:	
	lb	$t3,off_nm($a1)
	bltu	$t1,$t3,do
	
	l.d	$f6,off_grade($a1)
	div.d	$f8,$f2,$f6
	cvt.w.d	$f8,$f8
	mfc1	$t4,$f8
	
	sw	$t4,off_acc($a1)
	
	
	addiu	$t0,$t0,1
	addiu	$a1,$a1,40
	j	for

endf:	lw	$t2,off_cq($a1)
	mtc1.d	$t2,$f2
	cvt.d.w	$f2,$f2
	
	l.d	$f4,off_grade($a1)
	
	mul.d	$f0,$f2,$f4
	jr	$ra