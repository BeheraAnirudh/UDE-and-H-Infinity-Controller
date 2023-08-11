%% Part:2//H-infinity

%% defining system as LTI object
A=[0       1    0
   3306.63 0 -33.71
   0       0   -622.34];
B1=[0 0 0]';
B2=[ 0 0 53.19]';
C=[1 0 0];
C1=-C;
C2=-C;
%%Importance of D11,D12 etc For tracking z=r-Cx,where r=w.
D11=-0; % here it acts as lowe bound for   traking refrence r (initial value of r)
D12=0;
D21=-2; % here it acts as upper  bound for   traking refrence r (final  value of r)
          % - sign because of  C is -ve in P (example  C1=C2=-C)
D22=0;
P=ss(A,[B1  B2],[C1;C2],[D11 D12 ;D21  D22]);
 
ncont = 1;
nmeas = 1;
[K1,CL,gam1] = hinfsyn(P,nmeas,ncont);
%% K1 is conpensator transfer function
%% CL=  closed loop system transfer function steblizing plant P using K1(s)
%% given by CL=lft(P,K1)
%% find eigen values ans check controller tranfer and closed loop are stable or not
% % eig(Scll)
% % eig(K1)
 Controller=K1;
 Closed_loop=CL;
 
sprintf('H-infinity controller K1 achieved a norm of %1.0095 mm ',gam1)
 step(CL)
 %% Plant Matrices (P)//Type P in COMMAND window to get Plant matrix//
 Aa_m = [0 1 0
   3306.63 0 -33.71
   0 0 -622.34];
Bb_m = [0 0
       0 0
       0 53.19];
Cc_m = [-1 0 0
       -1 0 0];
Dd_m = [0 0
       0 0];
%% Controller (K1)//Type K1 in COMMAND window to get Control matrix//
Aaa_m = [-100500 1 0 
       -5773000 0 -33.71
       1352000000000 75700000 -71440];
Bbb_m = [-100500 0
        -5776000 0
        -424200000 0];
Ccc_m = [25420000000 1423000 -1331
         0 0 0];
Ddd_m = [0 0
         0 0];

