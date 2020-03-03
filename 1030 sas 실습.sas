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
