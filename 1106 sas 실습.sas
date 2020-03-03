/*모형적합 전 그래프*/
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

/*모형적합*/
title1 'Regression Analysis';
PROC REG DATA=scotland;
   MODEL Time = Distance Climb; 
RUN;

/*모형적합 후 그래프*/
title1 'Model Assessment';
PROC REG DATA=scotland 
        plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label));
     MODEL Time = Distance Climb / PARTIAL; 
RUN;


/*7번 자료 제거한 자료 새로 생성*/
DATA scot2 ;
	SET scotland ;
	if _n_ NE 7 ;
RUN ;
/*7번 자료 제거한 모형적합 후 그래프*/
PROC REG DATA=scot2 
        plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label));
     MODEL Time = Distance Climb / PARTIAL; 
RUN;

/*18번 자료 제거한 자료 새로 생성*/
DATA scot3 ;
	SET scotland ;
	if _n_ NE 18 ;
RUN ;
/*18번 자료 제거한 모형적합 후 그래프*/
PROC REG DATA=scot3 
        plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label));
     MODEL Time = Distance Climb / PARTIAL; 
RUN;

/*7번 자료 제거한 모형으로 최종모형을 적합하는 것이 좋다*/

/*7, 18번 자료 제거한 자료 새로 생성*/
DATA scot4 ;
	SET scot3 ;
	if _n_ NE 7 ;
RUN ;
/*7, 18번 자료 제거한 모형적합 후 그래프*/
PROC REG DATA=scot4
        plots=(diagnostics RStudentByLeverage(label) residuals(smooth) CooksD(label) DFFITS(label) ObservedByPredicted(label));
     MODEL Time = Distance Climb / PARTIAL; 
RUN;
