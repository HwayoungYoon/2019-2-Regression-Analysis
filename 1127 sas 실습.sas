/*���ڷ�: �����̸� ����*/
DATA advertise;
  SET adv;
  St = S_t;
  At = A_t;
  Pt = P_t;
  Et = E_t;
  Atp = A__t_1_;
  Ptp = P__t_1_;
  DROP S_t A_t P_t E_t A__t_1_ P__t_1_;
RUN;

/*���ڷ�: ȸ�͸���*/
PROC REG DATA=advertise
              plots=(diagnostics residuals(smooth));
    MODEL St = At Pt Et Atp Ptp / vif collinoint;
RUN;
/*Note: proportion of variation ���� 0.5���� ū ������ 2�� �̻��̸� ���߰����� ����*/


/*4���� ���������� ����� ȸ�͸���*/
PROC REG DATA=advertise
              plots=(diagnostics residuals(smooth));
    MODEL St = At Pt Et Atp / vif collinoint;
RUN;


/*Option1: 3���� ���������� ����� ȸ�͸���*/
PROC REG DATA=advertise
              plots=(diagnostics residuals(smooth));
    MODEL St = At Pt Et / vif collinoint;
RUN;


/*Option2: ���ڷῡ�� ���߰����� ���� 4 ������ �ϳ��� ������ ���� ������ ȸ�͸���*/
DATA advertise2;
  SET advertise;
  MeanAPt = (At+Pt+Atp+Ptp)/4;
  MeanAP = (At + Pt)/2;
RUN;

PROC REG DATA=advertise2
              plots=(diagnostics residuals(smooth));
    MODEL St = MeanAPt Et / vif collinoint;
RUN;


/*Option3: At�� Pt������ �ϳ��� ������ ���� ������ ȸ�͸���*/
PROC REG DATA=advertise2
              plots=(diagnostics residuals(smooth));
    MODEL St = MeanAP Et / vif collinoint;
RUN;


/*Option4: At�� Et������ ����Ͽ� ������ ȸ�͸���*/
PROC REG DATA=advertise2
              plots=(diagnostics residuals(smooth));
    MODEL St = At Et / vif collinoint;
RUN;


/*Option5: Pt�� Et������ ����Ͽ� ������ ȸ�͸���*/
PROC REG DATA=advertise2
              plots=(diagnostics residuals(smooth));
    MODEL St = Pt Et / vif collinoint;
RUN;
