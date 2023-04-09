x2=W20;  
% normalizacja do przedzialu [-1, 1]  
% jesli sygnaly sa mierzone w roznych odleglosciach
max_data=max(abs(W20));    
data=W20/max_data; 
xfft=abs(fft(x2)); 
xfft=xfft/44100;

xfft(1:499)=0;
xfft(1001:end)=0;

x1=1:1:44100; 
bar(x1(1:44100), xfft(1:44100));   
% wyrysowalo 2 razy zatem wyrysujemy 22050 
x1=1:1:22050; bar(x1(1:22050), xfft(1:22050));  
% dodajmy osie i etykiety osi axis([0,1000, 0,0.02]) ; 
xlabel('Skladowa czestotliwości [Hz]'); 
ylabel('Znormalizowania amplituda skladowej czestotliwosci');