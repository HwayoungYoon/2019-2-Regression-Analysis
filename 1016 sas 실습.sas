/* ��������*/
PROC REG;
   MODEL Y=X1 X2 X3 X4 X5 X6; 
RUN;
/* ��Ҹ���: X1�� X3�� ���� Y�� ȸ�͸���*/
PROC REG;
   MODEL Y=X1 X3;
RUN;
/* b1=b3 ������ ���� data step*/
DATA new;
   SET A;
   W = X1+X3;
RUN;
/* ��Ҹ���: W=(X1+X3)�� ���� Y�� ȸ�͸���*/
PROC REG data=new;
   MODEL Y = W;
RUN;
