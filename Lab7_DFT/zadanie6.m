clear all;
close all

syms t w

N = 10; % liczba próbek
fp = 1000; % Hz
Tp = 1/fp;
A0 = 5;
A1 = 1; f3 = 150; % Hz
x1 = A1*sin(2*pi*f3*t);
x = x1;

tn = [0:N-1]*Tp; % wsp. czasowe próbek
xn = double(subs(x,t,tn));
Xk = zeros(1,N);

for k = 0:N-1 % impl. wzoru (8)
    for n = 0:N-1
        Xk(k+1) = Xk(k + 1) + xn(n + 1)*(exp(-1j*2*pi/N)^(k*n));
    end
end

Xk_fft = fft(xn,N); %funkcja wbudowana
dft_err = sum(abs(Xk_fft-Xk))
disp('DFT error:'); disp(dft_err);

wk = fp*[0:floor(N/2)-1]/N;

figure;
subplot(2,1,1)
ezplot(x,[tn(1),tn(N)]); hold on; grid on
plot(tn, xn,'ob');
xlabel('t [s]'); ylabel('x(nT_p)');

subplot(2,1,2)
stem(real(Xk),'ob'); grid on, hold on
stem(imag(Xk),'*r');
title('Widmo'),
ylabel('X(k\Omega_p)'); %xlabel('f [Hz]')
legend('real','imag')
hold off

tol = 10e-5;
Xk( abs(Xk) < tol ) = 0;

figure;
subplot(2,1,1);
stem(wk, abs(Xk(1:N/2)), 'ob'); grid on; hold on;
ylabel('|X(k\Omega_p)|');
title('Gęstość widmowa amplitudy');
xlabel('f [Hz]');
 
subplot(2,1,2);
stem(wk, angle(Xk(1:N/2)), '*r'); grid on;
yticks([-2*pi, -1.5*pi, -pi, -pi/2, 0, pi/2, pi, 1.5*pi, 2*pi]);
ylim([-pi, pi]);
yticklabels({'-2\pi', '-3/2\pi', '-\pi','-\pi/2','0','\pi/2','\pi', '3/2\pi', '2\pi'})
ylabel('\phi(k\Omega_p)');
title('Gęstość widmowa fazy');
xlabel('f [Hz]');
hold off