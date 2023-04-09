rng default
x = rand(2, 15);
b=1;
a = [1, -0.2];
y = filter(b, a, x, [], 2);
t = 0:length(x)-1; %indeks wektora

close all
plot(t, x(1, :));
hold on
plot(t, y(1,:))
legend('Input Data', 'Filtered Data')
title('First Row')
hold off




