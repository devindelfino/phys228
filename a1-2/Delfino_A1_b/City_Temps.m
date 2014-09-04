% Devin Delfino
% PHYS 228: Scientific Computing
% Assignment 1: Looking for Climate Change, Part 2

% load variables from Assignment 1, part 1

clear %clears workspace to prevent unknown error

load aires.dat
months = aires(:,1);
temperature_C = aires(:,3);
location = 'Buenos Aires, Argentina';
years = (months/12)+1960;

num_months = 1:length(years);

% Calculates the average annual cycle for January
annual_cycle(1) = mean(temperature_C(mod(num_months, 12)==1));

% Deconstructing the previous line of code...

% 1. mod(num_months,12) - Performs modular arithmetic of 12 on the vector containing the integers 1 - the number of months recorded (2055)
% 2. mod(num_months,12)==1 - January comprises months 1, 13, 25, ...,  12n+1, so setting the modular arithmetic results == 1 will create a vector of 1's and 0's
%                            representing which months in the list are January
% 3. temperature_C(mod(num_months, 12)==1) - Uses the vector of 1's and 0's to index into the temperatures recorded in each month, extracting the temperatures recorded in January
% 4. mean(temperature_C(mod(num_months, 12)==1)) - Takes the mean of the temperatures recorded in January

% Calculates the average annual cycle for each month
annual_cycle(2) = mean(temperature_C(mod(num_months, 12)==2));
annual_cycle(3) = mean(temperature_C(mod(num_months, 12)==3));
annual_cycle(4) = mean(temperature_C(mod(num_months, 12)==4));
annual_cycle(5) = mean(temperature_C(mod(num_months, 12)==5));
annual_cycle(6) = mean(temperature_C(mod(num_months, 12)==6));
annual_cycle(7) = mean(temperature_C(mod(num_months, 12)==7));
annual_cycle(8) = mean(temperature_C(mod(num_months, 12)==8));
annual_cycle(9) = mean(temperature_C(mod(num_months, 12)==9));
annual_cycle(10) = mean(temperature_C(mod(num_months, 12)==10));
annual_cycle(11) = mean(temperature_C(mod(num_months, 12)==11));
annual_cycle(12) = mean(temperature_C(mod(num_months, 12)==0));

% Calculates Monthly Temperature Anomaly for each month
for(it=num_months)
	current_month = mod(it,12);
	if(current_month==0)
		current_month = 12;
	end
	mon_anomaly(it) = temperature_C(it) - annual_cycle(current_month);
end

figure;
plot(years, mon_anomaly);
ylabel('Temperature Anomaly (C)');
xlabel('Year');
title(strcat(location,' Temperature Anomaly, Seasonal Cycle Removed'));
grid;

% Moving Average
Moving_Average(10,years,mon_anomaly, location);
Moving_Average(5,years,mon_anomaly, location);
Moving_Average(1,years,mon_anomaly, location);

Moving_Average(100, years, mon_anomaly, location);


