%% Homework 7 Problem 5
G5 = zpk([],[-2,-5,-10],2);
G5expand = tf(G5)
hold on
rlocus(G5);
int5 = -5.67;
break5 = -3.333;
intY5 = 8.9;
intYNeg5 = -intY5;
plot(int5,0,'d', break5,0,'d', 0, intY5,'d', 0, intYNeg5,'d');
line([-5.667,0], [0,-9.82], 'Color', 'k');
line([-5.667,0], [0,9.82], 'Color', 'k');

%% Homework 7 Problem 6
G6 = zpk([-1],[1,-5,-9,-10],2);
G6expand = tf(G6)
figure;
hold on
rlocus(G6);
int6 = -7.333;
break6 = -6.4026;
intY6 = 12;
intYNeg6 = -intY6;
plot(int6,0,'d', break6,0,'d', 0, intY6,'d', 0, intYNeg6,'d');
line([int6,0], [0,-12.7], 'Color', 'k');
line([int6,0], [0,12.7], 'Color', 'k');

%% Homework 7 Problem 7
G7 = zpk([-2*j,2*j],[0,-2,-5,-10],2);
G7expand = tf(G7)
figure;
hold on
rlocus(G7);
int7 = -8.5;
break7 = -7.693;
plot(int7,0,'d', break7,0,'d');
line([-8.5,-8.5], [-20,20], 'Color', 'k');
line([-8.5,-8.5], [-20,20], 'Color', 'k');

%% Homework 7 Problem 8
G8 = zpk([],[0,-2,-5,-10],20);
G8expand = tf(G8)
figure;
hold on
rlocus(G8);
int8 = -4.25;
break8first = -8.29;
break8second = -0.83;
intY8 = 2.43;
intYNeg8 = -intY8;
plot(int8,0,'d', break8first,0,'d', break8second,0,'d', 0, intY8,'d', 0, intYNeg8,'d');
line([-12.85,4.25], [-8.5,8.5], 'Color', 'k');
line([-12.85,4.25], [8.5,-8.5], 'Color', 'k');