daneP = zaladuj("daneP.csv");
R = daneP(:, 1);
G = daneP(:, 2);
B = daneP(:, 3);

figure

plot(R)
title("Kolumna R")

figure

plot(G)
title("Kolumna G")

figure 

plot(B)
title("Kolumna B")

okres = 170:220;

figure

plot(R(okres, :))
title("Okresowy przedział kolumny R")

figure

plot(G(okres, :))
title("Okresowy przedział kolumny G")

figure

plot(B(okres, :))
title("Okresowy przedział kolumny B")

R_trend = polyval(polyfit(okres, R(okres, :), 4), okres)';
G_trend = polyval(polyfit(okres, G(okres, :), 4), okres)';
B_trend = polyval(polyfit(okres, B(okres, :), 4), okres)';

figure 

hold on

plot(okres, R(okres, :))
plot(okres, R_trend)
title("Okresowy przedział kolumny R z linią trendu")

hold off

figure 

hold on

plot(okres, G(okres, :))
plot(okres, G_trend)
title("Okresowy przedział kolumny G z linią trendu")

hold off

figure 

hold on

plot(okres, B(okres, :))
plot(okres, B_trend)
title("Okresowy przedział kolumny B z linią trendu")

hold off

R_ntrend = R(okres, :) - R_trend;
G_ntrend = G(okres, :) - G_trend;
B_ntrend = B(okres, :) - B_trend;

figure

plot(okres, R_ntrend)
title("Okresowy przedział kolumny R bez trendu")

figure

plot(okres, G_ntrend)
title("Okresowy przedział kolumny G bez trendu")

figure 

plot(okres, B_ntrend)
title("Okresowy przedział kolumny B bez trendu")
