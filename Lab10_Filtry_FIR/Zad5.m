load chirp
t = (0:length(y)-1)/Fs;

ord = 46;
low = 0.4;
bnd = [0.5 0.99];
bM = fir1(ord,[low bnd],'DC-1');
fvtool(bM)

outF = filter(bM,1,y);
xfft=abs(fft(outF));
xfft=xfft/13129;
x1=1:1:6564;
bar(x1(1:6564),xfft(1:6564));
axis([0,6564, 0,0.01]) ;