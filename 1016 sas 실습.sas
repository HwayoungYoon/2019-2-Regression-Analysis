/* 완전모형*/
PROC REG;
   MODEL Y=X1 X2 X3 X4 X5 X6; 
RUN;
/* 축소모형: X1과 X3에 대한 Y의 회귀모형*/
PROC REG;
   MODEL Y=X1 X3;
RUN;
/* b1=b3 검정을 위한 data step*/
DATA new;
   SET A;
   W = X1+X3;
RUN;
/* 축소모형: W=(X1+X3)에 대한 Y의 회귀모형*/
PROC REG data=new;
   MODEL Y = W;
RUN;
