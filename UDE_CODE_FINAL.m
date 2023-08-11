 s=tf('s')
del_A=0;

A=[0       1    0
   3306.63 0 -33.71
   0       0   -622.34];
B=[0 0 53.19]';

C=[1 0 0];
D=[0];
[b,a] = ss2tf(A,B,C,D);
sys = ss(A,B,C,D);
TF_OL = tf(sys);
%% stebility of open loop poles
poles = eig(A);
%% CONTROLLEBILITY & OBSERVBILITY
Co = ctrb(A,B);
rank(Co)  % since rank is =3 hence controllabe;
obsv(A,C);
Ob = obsv(A,C);
rank(Ob);   % since rank is =3 hence observable  in nature;

%% chossing refrence dynmics
A_m= [0      1    0
       3306.63      0     -33.7
      849771    10483.9   -1100];
B_m= [0 0 -10000]';

C_m =[ 1 0 0];
D_m=[0];

%%

vv= [inv(B'*B)*B'];
B_plus=vv;
A_plus_delA=A+del_A;
kk=A_m-A;

[b_m,a_m] = ss2tf(A_m,B_m,C_m,D_m);
sys_m = ss(A_m,B_m,C_m,D_m);
TF_m = tf(sys_m);

 

 
Gf=1/(0.01*s+1);  % bandwidth=1/T(bcoz of LPF in nature);
%% Assuming no uncertainity in system hence:-
%F=0;

%%During performing del_A operation, kindly put del_A value as below instead of 0.
%// del_A = [0 0 0;0 0 0;0 0 100];%%
