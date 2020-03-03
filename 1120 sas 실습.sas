DATA house ;
	SET housing ;
	ID=_N_ ;
RUN ;

/*�ܼ�ȸ�͸���*/
PROC REG DATA=house plots=(diagnostics residuals(smooth));
	MODEL H = P / dwProb ;
	OUTPUT OUT=res(keep = ID residual) R=residual ;
RUN ;

symbol1 v=dot i=join ;
PROC GPLOT DATA=res ;
	PLOT residual*ID / vref=0 ;
RUN ;

/*����ȸ�͸���*/
PROC REG DATA=house plots=(diagnostics residuals(smooth));
	MODEL H = P D / dwProb ;
	OUTPUT OUT=res2(keep = ID residual) R=residual ;
RUN ;
PROC GPLOT DATA=res2 ;
	PLOT residual*ID / vref=0 ;
RUN ;

/*18�� ������ ������ ����ȸ�͸���*/
DATA house2 ;
	SET house ;
	IF _n_ NE 18 ;
RUN ;
PROC REG DATA=house2 plots=(diagnostics residuals(smooth));
	MODEL H = P D / dwProb ;
	OUTPUT OUT=res3(keep = ID residual) R=residual ;
RUN ;
PROC GPLOT DATA=res3 ;
	PLOT residual*ID / vref=0 ;
RUN ;
