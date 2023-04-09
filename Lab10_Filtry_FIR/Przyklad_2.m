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
'HalfPowerFrequency1', 59, 'HalfPowerFrequency2', 61,...
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
figure;
periodogram(noiseFreeSignal, [], [], Fs);
title('Po filtracji');

figure;
periodogram(openLoop, [], [], Fs);
title('Przed filtracją');
