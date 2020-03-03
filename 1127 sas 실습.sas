/*원자료: 변수이름 수정*/
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

/*원자료: 회귀모형*/
PROC REG DATA=advertise
              plots=(diagnostics residuals(smooth));
    MODEL St = At Pt Et Atp Ptp / vif collinoint;
RUN;
/*Note: proportion of variation 값이 0.5보다 큰 변수가 2개 이상이면 다중공선성 존재*/


/*4개의 예측변수만 사용한 회귀모형*/
PROC REG DATA=advertise
              plots=(diagnostics residuals(smooth));
    MODEL St = At Pt Et Atp / vif collinoint;
RUN;


/*Option1: 3개의 예측변수만 사용한 회귀모형*/
PROC REG DATA=advertise
              plots=(diagnostics residuals(smooth));
    MODEL St = At Pt Et / vif collinoint;
RUN;


/*Option2: 원자료에서 다중공선성 높은 4 변수를 하나의 변수로 만들어서 적합한 회귀모형*/
DATA advertise2;
  SET advertise;
  MeanAPt = (At+Pt+Atp+Ptp)/4;
  MeanAP = (At + Pt)/2;
RUN;

PROC REG DATA=advertise2
              plots=(diagnostics residuals(smooth));
    MODEL St = MeanAPt Et / vif collinoint;
RUN;


/*Option3: At와 Pt변수를 하나의 변수로 만들어서 적합한 회귀모형*/
PROC REG DATA=advertise2
              plots=(diagnostics residuals(smooth));
    MODEL St = MeanAP Et / vif collinoint;
RUN;


/*Option4: At와 Et변수만 사용하여 적합한 회귀모형*/
PROC REG DATA=advertise2
              plots=(diagnostics residuals(smooth));
    MODEL St = At Et / vif collinoint;
RUN;


/*Option5: Pt와 Et변수만 사용하여 적합한 회귀모형*/
PROC REG DATA=advertise2
              plots=(diagnostics residuals(smooth));
    MODEL St = Pt Et / vif collinoint;
RUN;
