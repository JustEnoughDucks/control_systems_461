%% Control System Homework 12 Problem 3

w = logspace(-1,1,100)';
s = j*w;
Gp = [0 -98 -136 -160 -176 -188];
Gm = [29.11 21.07 13.46 7.58 2.77 -1.31];

% M-Circle
phase = [0:0.01:1]' * 2*pi;
Mcl = 2 * exp(j*phase);
Mol = Mcl ./ (1 - Mcl);
Mp = unwrap(angle(Mol))*180/pi - 360;
Mm = 20*log10(abs(Mol));
hold on
plot([-180 -180],[10,-10],'--');
plot(Gp,Gm,'k',Mp,Mm,'r');
plot(Gp,Gm - 1.41,'g');
hold off
xlabel('Phase (degrees)');
ylabel('Gain (dB)');
title('Nichols chart');


%Stability gain range k < -1.41
k3 = -1.41 


%Plot Mm = +6dB portion
M6 = (10^(6/20))*exp(j*phase);
M6ol = M6 ./ (1 - M6);
M6p = unwrap(angle(M6ol))*180/pi - 360;
M6m = 20*log10(abs(M6ol));

figure;
plot(Gp,Gm,'b',M6p,M6m,'r');
hold on
plot(Gp,Gm - 10.19,'k');
plot(Gp,Gm - 9);
plot(Gp,Gm - 9.75);
plot(Gp,Gm - 10.19,'k');
hold off
xlabel('Phase (degrees)');
ylabel('Gain (dB)');
legend('Base Gain','M-Circle','-9dB','-10dB','-10.19dB');
title('Nichols chart');
k6 = 10.19;

%% Control Systems Homework 12 Problem 4

w4 = logspace(-1,1,100)';
s4 = j*w4;
Gw4 = 1000 ./ ((s4+2) .* (s4+5) .* (s4+20));
Gwp4 = unwrap(angle(Gw4))*180/pi;
Gwm4 = 20*log10(abs(Gw4));
% M-Circle Mm = 6
phase4 = [0:0.01:1]' * 2*pi;
Mcl4 = (10^(6/20))*exp(j*phase);
Mol4 = Mcl4 ./ (1 - Mcl4);
Mp4 = unwrap(angle(Mol4))*180/pi - 360;
Mm4 = 20*log10(abs(Mol4));
figure;
hold on
plot(Gwp4,Gwm4,'b',Mp4,Mm4,'r');
plot([-180 -180],[10,-10],'--');
plot(Gwp4,Gwm4 + 2, Gwp4, Gwm4 + 2.5);
plot(Gwp4,Gwm4 + 2.89,'g');
hold off
xlabel('Phase (degrees)');
ylabel('Gain (dB)')
title('Nichols chart');

k4 = 2.89
Gw4_cl = Gw4*k4 ./ (1 + Gw4*k4) ;
figure
plot(w,abs(Gw4_cl));
xlabel('Frequency (rad/sec)');
ylabel('Closed-Loop Gain');
title('Nichols Close Loop Response');

%% Control Systems Homework 12 Problem 5

w4 = logspace(-1,1,100)';
s4 = j*w4;
Gw4 = 1000 * exp(-0.2.*s) ./ ((s4+2) .* (s4+5) .* (s4+20));
Gwp4 = unwrap(angle(Gw4))*180/pi;
Gwm4 = 20*log10(abs(Gw4));
% M-Circle Mm = 6
phase4 = [0:0.01:1]' * 2*pi;
Mcl4 = (10^(6/20))*exp(j*phase);
Mol4 = Mcl4 ./ (1 - Mcl4);
Mp4 = unwrap(angle(Mol4))*180/pi - 360;
Mm4 = 20*log10(abs(Mol4));
figure;
hold on
plot(Gwp4,Gwm4,'b',Mp4,Mm4,'r');
plot([-180 -180],[10,-10],'--');
plot(Gwp4,Gwm4 - 5, Gwp4, Gwm4 - 6);
plot(Gwp4,Gwm4 - 6.99,'g');
hold off
xlabel('Phase (degrees)');
ylabel('Gain (dB)')
title('Nichols chart');

k4 = - 2.89
Gw4_cl = Gw4*k4 ./ (1 + Gw4*k4) ;
figure
plot(w,abs(Gw4_cl));
xlabel('Frequency (rad/sec)');
ylabel('Closed-Loop Gain');
title('Nichols Close Loop Response');

%% Control Systems Homework 12 Problem 6
figure;
% Nyquist Diagram
phase = [0:0.001:1]' * 2 * pi;
% Closed-Loop Gain (Mm)
M6 = (10^(6/20))*exp(j*phase);
% corresponding open-loop gain (M-circles)
M6ol = M6 ./ (1 - M6);
plot(real([M6ol]),imag([M6ol]),'r')
xlabel('real');
ylabel('imag');
title('Nyquist Diagram');
% Add G(jw) ontop
w = [1:0.01:20]';
s = j*w;
k6 = db2mag(2.89);
Gw6 = k6* 1000 ./ ( (s+2) .* (s+5) .* (s+20) );
hold on
plot(real(Gw6),imag(Gw6),'g');
plot([-1 -.5],[0,-.5],'k');
plot([-1.5 -.5],[0,-1],'k');
plot([-2, -.5],[0,-1.5],'k');
hold off

%% Control Systems Homework 12 Problem 7

phase = [0:0.001:1]' * 2 * pi;
% Closed-Loop Gain (Mm)
M6 = (10^(6/20))*exp(j*phase);
% corresponding open-loop gain (M-circles)
M6ol = ( M6 ./ (1 - M6) ) .^ (-1);
line6 = line([-4,0],[0,0]);
figure;
plot(real(M6ol),imag(M6ol),'r')
xlabel('real');
ylabel('imag');
title('Inverse Nyquist Diagram');

% Add G(jw) ontop
w = [1:0.01:20]';
s = j*w;
k7 = db2mag(2.89);
Gw7 = k7 * 1000 ./ ( (s+2) .* (s+5) .* (s+20) );
hold on
plot(real(Gw7 .^ (-1)),imag(Gw7 .^ (-1)),'g');
line([-4,0],[0,0]);
hold off