clear
clc

%% Controls Homework 11 Problem 1
Gs1 = zpk([],[0 -10 -15 -50],200);

X1 = evalfr(Gs1, -2.6 + 5.08j)
K1 = -1/X1

Gcl1 = minreal(Gs1*abs(K1) / (1 + Gs1*abs(K1)))

T = .05;

s1 = [roots([1 4.656 27.64])', roots([1 45.34 536.3])'];
z1 = exp(s1*T);

Gz1p = zpk([],z1,1,T)
Gs1 = zpk([],s1,14823)
kz1 = evalfr(Gz1p, 1);
ks1 = evalfr(Gs1, 0);
k1 = ks1/kz1
Gz1 = zpk([0 0],z1,k1,T);

Kz1 = zpk([0.8187 0.6065],[1 -0.0834],34.7201,.1)
Kz1 = tf(Kz1)

step(Gcl1)

%% Controls Homework 11 Problem 2

T2 = .250;

s2 = [roots([1 4.656 27.64])', roots([1 45.34 536.3])'];
z2 = exp(s2*T2);

Gz2p = zpk([],z2,1,T2);
Gs2 = zpk([],s2,14823);
kz2 = evalfr(Gz2p, 1);
ks2 = evalfr(Gs2, 0);
k2 = ks2/kz2
Gz2 = zpk([0 0],z2,k2,T2)

Kz2 = zpk([0.2865 0.6065],[1 -0.7287],31.5021,.25)
Kz2 = tf(Kz2)

figure;
step(Gs2)
