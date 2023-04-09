T = 1; 
amplitude = 1; 
num = 1;
xtranslation =0;
[t,y] = rect(T,num,amplitude,xtranslation);
plot(t,y)
grid on
xlabel('t')
ylabel('x(t)')

function [t,y] = rect(T_period,num,ampli,xtranslation)
    t = -T_period*num:0.01:T_period*num;
    y_0=0;
    y_1=1;
    if xtranslation>=T_period/2
        num = num+round((2*xtranslation/T_period));
    end
    for i=-num:num
        y_0=y_0 + 0.*(t>T_period/2+(T_period*(i-1)) & t<T_period*num);
        y_1=y_1 + 1.*(t>T_period*(i-1) & t<T_period/2+(T_period*(i-1)));
    end
    y= (y_0 + y_1);
    y = ampli*(y-min(y));
    t = t-xtranslation;
end
