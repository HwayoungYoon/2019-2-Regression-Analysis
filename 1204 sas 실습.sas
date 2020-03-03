/*���ڷ�: ȸ�͸���*/
PROC REG DATA=super
    MODEL Y = X1 X2 X3 X4 X5 X6 / vif collinoint;
RUN;
/*Note: proportion of variation ���� 0.5���� ū ������ 2�� �̻��̸� ���߰����� ����*/


/*��������: �������ù�*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=FORWARD DETAILS;
RUN;
/*Note: default p-value for entry  into model is SLE=0.5*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=FORWARD SLE=0.2;
RUN;
/*Note: SLE=## sets criterion for entry into model*/


/*��������: �������Ź�*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=BACKWARD DETAILS;
RUN;
/*Note: default p-value for staying in model is SLS=0.1*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=BACKWARD SLS=0.2;
RUN;
/*Note: SLS=## sets criterion for elimination from model*/


/*��������: �ܰ������*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=stepwise SLE=0.2 SLS=0.1 DETAILS;
RUN;


/*��������: ��� �κи���*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=cp DETAILS;
RUN;


/*��������: ���������������*/
PROC REG DATA=super;
    MODEL Y = X1 X2 X3 X4 X5 X6 / SELECTION=ADJRSQ DETAILS;
RUN;
