figure
load openloop60hertz, openLoop = openLoopVoltage;
Fs=1000;
t=(0:length(openLoop)-1)/Fs;
plot(t, openLoop); box on; grid on;
ylabel 'Voltage [V]', xlabel 'Time [s]'
title('Open-Loop Voltage with Noise')

figure;
periodogram(openLoop, [], [], Fs);

%Projekt flitra
filtCoeff = designfilt('bandstopiir', 'FilterOrder', 2,...
'HalfPowerFrequency1', 49, 'HalfPowerFrequency2', 71,...
'SampleRate', Fs);

%Wykres filtru
fvtool(filtCoeff)
noiseFreeSignal = filter(filtCoeff, openLoop);

close all
figure;

% Wynik w dziedzinie czasu
plot(t, openLoop, t, noiseFreeSignal); grid on;
legend('Przed filtracja', 'Po filtracji');
ylabel('Napiecie [V]'), xlabel('Czas [s]');

%Wynik w dziedzinie czestotliwosci
figure, hold on;
periodogram(noiseFreeSignal, [], [], Fs);
title('Po filtracji');
plot([50 50], [-70 30], 'r.-.');
plot([70 70], [-70 30], 'r.-.');
hold off;


figure;
periodogram(openLoop, [], [], Fs);
title('Przed filtracja');



