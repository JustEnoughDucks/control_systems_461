%% Controls Homework 9 Problem 1
G1 = zpk([],[0 -7 -10 -15],[200]);
[num,den] = pade(0.2, 2);
Delay = tf(num,den);
rlocus(G1*Delay);
Gs1 = zpk(G1*Delay)

X1 = evalfr(Gs1, -1.03626 + 2.02270j)
K1 = -1/X1

Gcl1 = minreal(Gs1*abs(K1) / (1 + Gs1*abs(K1)))
roots([ 1 2.908 10.09])
figure;
step(Gcl1)

%% Controls Homework 9 Problem 2


% Added s+5 zero to stabilize (no pole needed since extra pole present
G2 = zpk([-.5],[-2 -4j 4j],[200]);
figure;
rlocus(G2)

% Find first K
X2_1 = evalfr(G2, -0.218 + 4.78j)
K2_1 = -1/X2_1
Gcl2_1 = minreal(G2*abs(K2_1) / (1 + G2*abs(K2_1)))
roots([1 .4368 22.9])

% Cancel complex pole with zero
Gk2 = zpk([-.5],[-1.563],[7.5781]);
figure;
rlocus(Gk2)

% Add pole to cancel zero, add 0 pole for DC gain of 1
% Then add lead compensator zero to cancel pole of -1.563 and -4 to pull it
% back to meet timing
Gk2_2 = zpk([],[0, -4, -6],[7.5781]);
X2_2 = evalfr(Gk2_2, -1.1477 + 2.2355j)
K2_2 = -1/X2_2

Gcl2_2 = minreal(Gk2_2*abs(K2_2) / (1 + Gk2_2*abs(K2_2)))
roots([1 2.295 6.315])
figure;
step(Gcl2_2);