%% Control Systems Homework 8

G1 = zpk([],[-2 -5 -10 -15],[200]);
rlocus(G1);
X1a = evalfr(G1, );
k1a = 1/X1a

Gcl1a = minreal(G1*k1a / (1+G1*k1a));
zpk(Gcl1a)