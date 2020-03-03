/*5�� 7��*/
DATA co ;
   SET corn ;
   F1=0 ; F2=0 ; F3=0 ;
   IF Fertilizer=1 THEN F1=1;
   IF Fertilizer=2 THEN F2=1;
   IF Fertilizer=3 THEN F3=1 ;
RUN ;

PROC REG DATA=co ;
	MODEL Yield= F1 F2 F3 ;
RUN ;


/*8�� 3��*/
/*�������� ���� �����ͼ� ����*/
DATA pres ;
	SET president ;
	GI=G * I ;
	ID=_N_ ;
RUN ;

/*a�� ����*/
PROC REG DATA=pres plots=(diagnostics residuals(smooth)) ;
	MODEL V = I D W GI P N / dwProb;
    OUTPUT OUT=res(keep = ID residual) R=residual;
RUN;
symbol1 v=dot i=join;
PROC GPLOT DATA=res;
   PLOT residual*ID / vref=0;
RUN;

/*b�� ����*/
PROC REG DATA=pres plots=(diagnostics residuals(smooth)) ;
	MODEL V = I D W GI P N Year / dwProb;
    OUTPUT OUT=res2(keep = ID residual) R=residual;
RUN;
symbol1 v=dot i=join;
PROC GPLOT DATA=res2;
   PLOT residual*ID / vref=0;
RUN;
