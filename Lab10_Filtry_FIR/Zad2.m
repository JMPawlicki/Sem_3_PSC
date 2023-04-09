x = [1, 2, 3, 4, 5, 4, 3, 4, 5, 6, 7];

b=1;
a = [1, -0.5];
y = filter(b, a, x, [], 2);
t = 0:length(x)-1; %indeks wektora

close all
plot(t, x(1, :));
hold on
plot(t, y(1,:))
legend('Input Data', 'Filtered Data')
title('First Row')