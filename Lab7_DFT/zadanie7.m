clear;
close all;
syms t w

N = 10;
fp = 1000; % Hz
Tp = 1/fp;
A0 = 5;
A1 = 10; f1 = 100; % Hz
A2 = 5.0; f2 = 200;
f3 = 150;
x1 = A1*sin(2*pi*f1*t);
x3 = sin(2*pi*f3*t);
x8 = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t);
x = x1;

tn = [0:N-1]*Tp;
wk = fp*[0:N/2-1]/N;
xn = double(subs(x,t,tn));
Xk = zeros(1,N);

xn = xn.*triang(N)';
%xn = xn.*window(@gausswin,N,2.5)';
%xn = xn.*chebwin(N)';

%przesuniecie cykliczne
xm = zeros(1,N);
m = 0;
for n = 0:N-1
     xm(n+1) = xn(mod(n + m, N)+1);
end
xn = xm;

for k = 0:N-1
    for n = 0:N-1
         Xk(k+1) = Xk(k+1) + xn(n+1)*exp(-1j*2*pi/N*k*n);
    end
end

figure(1);
subplot(2,1,1);
ezplot(x,[tn(1),tn(N)]); hold on; grid on;
plot(tn, xn, 'ob');
xlabel('t [s]'); ylabel('x(nT_p)');

subplot(2,1,2);
stem(wk, real(Xk(1:N/2)), 'ob'); grid on; hold on;
stem(wk, imag(Xk(1:N/2)), '*r');
title('Widmo');
ylabel('X(k\Omega_p)'); xlabel('f [Hz]');
legend('real', 'imag');

tol = 1e-2;
Xk(abs(Xk) < tol) = 0;

figure(2);
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


