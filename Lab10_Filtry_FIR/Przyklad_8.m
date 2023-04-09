x2=W20;  
% normalizacja do przedzialu [-1, 1]  
% jesli sygnaly sa mierzone w roznych odleglosciach
max_data=max(abs(W20));    
data=W20/max_data; 
xfft=abs(fft(x2)); 
xfft=xfft/44100;
xfft(1001:44100)=0;


