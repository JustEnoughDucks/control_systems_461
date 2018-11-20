%% Controls Homework 11 Problem 1
Gs1 = zpk([],[2 -10 -15 -30],[200]);

X1 = evalfr(Gs1, -2)
K1 = -1/X1

Gcl1 = minreal(Gs1*abs(K1) / (1 + Gs1*abs(K1)))

Gs1_2 = zpk([],[0 -8 -20.24 -28.46],[11648]);

X1_2 = evalfr(Gs1_2, -2.3302 + 4.5505i)
K1_2 = -1/X1_2

Gcl1_2 = minreal(Gs1_2*abs(K1_2) / (1 + Gs1_2*abs(K1_2)))

T = .1;

s1 = [roots([1 52.04 697])', roots([1 4.66 26.14])'];
z1 = exp(s1*T);

Gz1 = zpk([],z1,1);
Gs1 = zpk([],s1,18216);
kz1 = evalfr(Gz1, 1);
ks1 = evalfr(Gs1, 0);
k1 = ks1/kz1
Gz1 = zpk([0 0],z1,k1,T)
Gz1tf = tf(Gz1)

step(Gz1)
hold on
step(Gs1)
hold off

%% Controls Homework 11 Problem 2

T2 = .250;

s1 = [roots([1 52.04 697])', roots([1 4.66 26.14])'];
z1 = exp(s1*T2);

Gz1 = zpk([],z1,1);
Gs1 = zpk([],s1,18216);
kz1 = evalfr(Gz1, 1);
ks1 = evalfr(Gs1, 0);
k1 = ks1/kz1
Gz1 = zpk([0 0],z1,k1,T2)
Gz1tf = tf(Gz1)

figure;
step(Gz1)
hold on
step(Gs1)
hold off
