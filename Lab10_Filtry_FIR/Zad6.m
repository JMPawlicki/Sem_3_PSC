% W piatym po przecinku w bM dodac 'DC-1'

ord = 46;
low = 0.4;
bnd = [0.5 0.99];
bM = fir1(ord, [low bnd], 'DC-0', tukeywin(ord+1));
fvtool(bM)


load chirp
t = (0:length(y)-1)/Fs;

hM = fir1(ord, [low bnd], 'DC-0', hann(ord+1));

hfvt = fvtool(bM,1,hM,1); %porownanie okien
legend(hfvt, 'Tukey', 'Hamming')

outhann = filter(hM, 1, y);

xfft=abs(fft(outhann)); 
xfft=xfft/13129; 
x1=1:1:6564; 
bar(x1(1:6564), xfft(1:6564));   
axis([0,6564, 0,0.01]) ;
