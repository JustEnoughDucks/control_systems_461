%% Control Systems Homework 5 Problem 1 Part c
A1 = [20, -2, 0, 0; 10, 0, -10, 0];
B1 = [2;0;0;0];
C1 = [0,0,0,1];
D1 = [0];
G1 = ss(A1,B1,C1,D1);
tf(G1)
zpk(G1)

t1 = 0:0.01:10;
y1 = step(G1,t1);
plot(t1, y1);
xlabel('Time (seconds)');
ylabel('y (Volts)');

%% Control Systems Homework 5 Problem 2 Part c
A2 = [0, 5, -100, -5; 0, 0, 4, 0];
B2 = [2;0;0;0];
C2 = [0,0,0,1];
D2 = [0];
G2 = ss(A2,B2,C2,D2);
tf(G2)
zpk(G2)

t2 = 0:0.01:10;
y2 = step(G2,t2);
figure;
plot(t2, y2);
xlabel('Time (seconds)');
ylabel('y (Volts)');



%% Control Systems Homework 5 Problem 3 Part c
A3 = [-20, -2, 0, 0; 10, 0, -10, 0; 0, 5, -100, -5; 0, 0, 4, 0];
B3 = [2;0;0;0];
C3 = [0,0,0,1];
D3 = [0];
G3 = ss(A3,B3,C3,D3);
tf(G3)
zpk(G3)

t3 = 0:0.1:50;
y3 = step(G3,t3);
figure;
plot(t3, abs(y3));
xlabel('Time (seconds)');
ylabel('y (Volts)');