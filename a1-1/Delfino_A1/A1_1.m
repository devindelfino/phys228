% Devin Delfino
% PHYS 228: Scientific Computing
% Assignment 1: Looking for Climate Change, Part 1

load blue_hills_temperature.tsv
months = blue_hills_temperature(:,1);
temperature_C = blue_hills_temperature(:,3);
years = (months/12)+1960;

temperature_F = (temperature_C*(9/5))+32;

figure;

% default positions [360 278 560 420]
set(figure(1), 'Position', [360 278 560 840])

% Plotting Blue Hills Temperature data in degrees Celsius
subplot(2,1,1);
plot(years, temperature_C);
ylabel('Temperature (C)');
xlabel('Year');
title('Temperature at Blue Hills (C), 1835-2006');
grid;

% Plotting Blue Hills Temperature data in degrees Fahrenheit
subplot(2,1,2);
plot(years, temperature_F,'g');
ylabel('Temperature (F)');
xlabel('Year');
title('Temperature at Blue Hills (F), 1835-2006');
grid;

figure;
set(figure(2), 'Position', [360 278 560 840])

% Plotting Blue Hills Temperature data in degrees Celsius for the last 10 years only
subplot(2,1,1);
plot(years(years>=1996),temperature_C(years>=1996));
ylabel('Temperature (C)');
xlabel('Year');
title('Temperature at Blue Hills (C), 1996-2006');
grid;

% Plotting Blue Hills Temperature data in degrees Fahrenheit for the last 10 years only
subplot(2,1,2);
plot(years(years>=1996),temperature_F(years>=1996), 'g');
ylabel('Temperature (F)');
xlabel('Year');
title('Temperature at Blue Hills (F), 1996-2006');
grid;