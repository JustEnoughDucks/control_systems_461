% Nichols Chart
phase = [0:0.001:1]' * 2 * pi;
% Closed-Loop Gain (Mm)
M1 = (10^(1/20))*exp(j*phase);
M2 = (10^(2/20))*exp(j*phase);
M3 = (10^(3/20))*exp(j*phase);
M6 = (10^(6/20))*exp(j*phase);
M9 = (10^(9/20))*exp(j*phase);
M12 = (10^(12/20))*exp(j*phase);
% corresponding open-loop gain (M-circles)
M1ol = M1 ./ (1 - M1);
M2ol = M2 ./ (1 - M2);
M3ol = M3 ./ (1 - M3);
M6ol = M6 ./ (1 - M6);
M9ol = M9 ./ (1 - M9);
M12ol = M12 ./ (1 - M12);
% plotting as phase vs. gain for a
M1p = unwrap(angle(M1ol))*180/pi -  360;
M2p = unwrap(angle(M2ol))*180/pi -  360;
M3p = unwrap(angle(M3ol))*180/pi -  360;
M6p = unwrap(angle(M6ol))*180/pi -  360;
M9p = unwrap(angle(M9ol))*180/pi -  360;
M12p = unwrap(angle(M12ol))*180/pi - 360;

% Nichols chart
M1m = 20*log10(abs(M1ol));
M2m = 20*log10(abs(M2ol));
M3m = 20*log10(abs(M3ol));
M6m = 20*log10(abs(M6ol));
M9m = 20*log10(abs(M9ol));
M12m = 20*log10(abs(M12ol));
plot([M1p,M2p,M3p,M6p,M9p,M12p],[M1m,M2m,M3m,M6m,M9m,M12m],'r')
xlabel('Phase (degrees)');
ylabel('Gain (dB)');
title('Nichols Chart');
% Add G(jw) ontop
w = [1:0.01:20]';
s = j*w;
Gw = 2000 ./ ( s .* (s+5) .* (s+20) );
Gwp = unwrap(angle(Gw))*180/pi;
Gwm = 20*log10(abs(Gw));
hold on
plot(Gwp,Gwm,'b');
hold off