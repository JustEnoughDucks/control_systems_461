%% Control Systems Homework 8 Problem 1

G = zpk([],[-2 -5 -10 -15],[200]);
rlocus(G);
X1 = evalfr(G, -1.8686 + 3.8160j)
k1 = -1/X1

Gcl1 = minreal(G*abs(k1) / (1+G*abs(k1)))
roots([1 3.737 18.05])
figure;
step(Gcl1)

%% Control Systems Homework 8 Problem 2

GK2 = zpk([-2],[-2 -5 -10 -15 -20], [200])
figure;
rlocus(GK2)
X2 = evalfr(GK2, -3.5679 + 6.9665i)
K2 = -1/X2

Gcl2 = minreal(GK2*abs(K2) / (1 + GK2*abs(K2)))
roots([1 7.136 61.26])
figure;
step(Gcl2)

%% Control Systems Homework 8 Problem 3

GK3 = zpk([],[0 -2 -5 -10 -15], [200])
figure;
rlocus(GK3)
X3 = evalfr(GK3, -0.5676 + 1.1091j)
K3 = -1/X3

Gcl3 = minreal(GK3*abs(K3) / (1 + GK3*abs(K3)))
roots([1 1.135 1.552])
figure;
step(Gcl3)

%% Control Systems Homework 8 Problem 4

GK4 = zpk([],[0 -10 -13 -15],[200])
figure;
rlocus(GK4)
X4 = evalfr(GK4, -1.9937 + 3.9875i)
K4 = -1/X4

Gcl4 = minreal(GK4*abs(K4) / (1 + GK4*abs(K4)))
roots([1 3.987 19.88])
figure;
step(Gcl4)

err4 = evalfr(Gcl4, 1000000)