/*원자료: 회귀모형*/
PROC REG DATA=super
    MODEL Y = X1 X2 X3 X4 X5 X6 / vif collinoint;
RUN;
/*Note: proportion of variation 값이 0.5보다 큰 변수가 2개 이상이면 다중공선성 존재*/


/*변수선택: 전진선택법*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=FORWARD DETAILS;
RUN;
/*Note: default p-value for entry  into model is SLE=0.5*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=FORWARD SLE=0.2;
RUN;
/*Note: SLE=## sets criterion for entry into model*/


/*변수선택: 후진제거법*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=BACKWARD DETAILS;
RUN;
/*Note: default p-value for staying in model is SLS=0.1*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=BACKWARD SLS=0.2;
RUN;
/*Note: SLS=## sets criterion for elimination from model*/


/*변수선택: 단계적방법*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=stepwise SLE=0.2 SLS=0.1 DETAILS;
RUN;


/*변수선택: 모든 부분모형*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=cp DETAILS;
RUN;


/*변수선택: 수정결정계수기준*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=ADJRSQ DETAILS;
RUN;
