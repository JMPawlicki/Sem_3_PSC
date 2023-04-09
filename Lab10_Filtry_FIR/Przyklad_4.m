%Z przykladu nr 3 nalezy obliczyc dane
x = rand(2, 15);
y = filter(b, a, x, [], 2);


load chirp;
Fs= 1000;
t = (0:length(y)-1)/Fs; %1.6 sekundy

xfft = abs(fft(y));
xfft = xfft/13129;
x1=1:1:6564;
bar(x1(1:6564), xfft(1:6564));
axis([0,6564, 0,0.01]);

bhi = fir1(34, 0.48, 'high', chebwin(35, 30));
freqz(bhi,1)
fvtool(bhi)
outhi=filter(bhi,1,y);

xfft=abs(fft(outhi));
xfft=xfft/13129;
x1=1:1:6564;
bar(x1(1:6564), xfft(1:6564));
axis([0,6564, 0,0.01]);

subplot(2,1,1)
plot(t,y)
title('Original Signal')
ys = ylim;

subplot(2,1,2)
plot(t,outhi)
title('Highpass Filtered Signal')
xlabel('Time (s)')
ylim(ys)





