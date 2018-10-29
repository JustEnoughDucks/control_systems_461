%% Control Systems Homework 8

G1 = zpk([],[-2 -5 -10 -15],[200]);
rlocus(G1);
X1a = evalfr(G1, -1.9100 + 3.7400i)
k1a = 1/X1a

Gcl1a = minreal(G1*k1a / (1+G1*k1a))

Gcl1aFinal = zpk([],[-16.9 .5461 (7.826 + 5.207j) (7.826-5.207j)],[-2315.1])