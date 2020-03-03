/*4.12 모형적합 1-6*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 X5 X6 / R INFLUENCE PARTIAL ;
RUN ;

/*4.13.a 모형적합 1-3*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 / PARTIAL ;
RUN ;

/*4.13.a 모형적합 1-4*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 / PARTIAL ;
RUN ;

/*4.13.b 모형적합 1-5*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 X5 / PARTIAL ;
RUN ;

/*4.13.c 모형적합 1-4,6*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 X6 / PARTIAL ;
RUN ;




/*38번 자료 제거한 데이터셋*/
DATA ex2 ;
	SET ex ;
	if _n_ NE 38 ;
RUN ;

/*38제외한 모형적합 1-4*/
PROC REG DATA=ex2
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 / PARTIAL ;
RUN ;

/*34번 자료 제거한 데이터셋*/
DATA ex3 ;
	SET ex ;
	if _n_ NE 34 ;
RUN ;

/*34제외한 모형적합 1-4*/
PROC REG DATA=ex3
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 / PARTIAL ;
RUN ;

/*34, 38번 자료 제거한 데이터셋*/
DATA ex4 ;
	SET ex2 ;
	if _n_ NE 34 ;
RUN ;

/*34, 38제외한 모형적합 1-4*/
PROC REG DATA=ex4
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 / PARTIAL ;
RUN ;
