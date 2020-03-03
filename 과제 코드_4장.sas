/*4.12 �������� 1-6*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 X5 X6 / R INFLUENCE PARTIAL ;
RUN ;

/*4.13.a �������� 1-3*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 / PARTIAL ;
RUN ;

/*4.13.a �������� 1-4*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 / PARTIAL ;
RUN ;

/*4.13.b �������� 1-5*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 X5 / PARTIAL ;
RUN ;

/*4.13.c �������� 1-4,6*/
PROC REG DATA=ex
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 X6 / PARTIAL ;
RUN ;




/*38�� �ڷ� ������ �����ͼ�*/
DATA ex2 ;
	SET ex ;
	if _n_ NE 38 ;
RUN ;

/*38������ �������� 1-4*/
PROC REG DATA=ex2
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 / PARTIAL ;
RUN ;

/*34�� �ڷ� ������ �����ͼ�*/
DATA ex3 ;
	SET ex ;
	if _n_ NE 34 ;
RUN ;

/*34������ �������� 1-4*/
PROC REG DATA=ex3
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 / PARTIAL ;
RUN ;

/*34, 38�� �ڷ� ������ �����ͼ�*/
DATA ex4 ;
	SET ex2 ;
	if _n_ NE 34 ;
RUN ;

/*34, 38������ �������� 1-4*/
PROC REG DATA=ex4
	plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label)) ;
   MODEL Y = X1 X2 X3 X4 / PARTIAL ;
RUN ;
