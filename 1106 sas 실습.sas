/*�������� �� �׷���*/
title1 '3D Plot';
PROC G3D DATA=scotland;
  scatter Distance*Climb=Time / 
          COLOR ='red' 
          SHAPE='diamond'
          ROTATE=15;
RUN;

title1 'Scatterplot Matrix';
PROC SGSCATTER DATA=scotland;
  matrix Time Distance Climb / diagonal=(histogram kernel);
RUN;

/*��������*/
title1 'Regression Analysis';
PROC REG DATA=scotland;
   MODEL Time = Distance Climb; 
RUN;

/*�������� �� �׷���*/
title1 'Model Assessment';
PROC REG DATA=scotland 
        plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label));
     MODEL Time = Distance Climb / PARTIAL; 
RUN;


/*7�� �ڷ� ������ �ڷ� ���� ����*/
DATA scot2 ;
	SET scotland ;
	if _n_ NE 7 ;
RUN ;
/*7�� �ڷ� ������ �������� �� �׷���*/
PROC REG DATA=scot2 
        plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label));
     MODEL Time = Distance Climb / PARTIAL; 
RUN;

/*18�� �ڷ� ������ �ڷ� ���� ����*/
DATA scot3 ;
	SET scotland ;
	if _n_ NE 18 ;
RUN ;
/*18�� �ڷ� ������ �������� �� �׷���*/
PROC REG DATA=scot3 
        plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label));
     MODEL Time = Distance Climb / PARTIAL; 
RUN;

/*7�� �ڷ� ������ �������� ���������� �����ϴ� ���� ����*/

/*7, 18�� �ڷ� ������ �ڷ� ���� ����*/
DATA scot4 ;
	SET scot3 ;
	if _n_ NE 7 ;
RUN ;
/*7, 18�� �ڷ� ������ �������� �� �׷���*/
PROC REG DATA=scot4
        plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label));
     MODEL Time = Distance Climb / PARTIAL; 
RUN;
