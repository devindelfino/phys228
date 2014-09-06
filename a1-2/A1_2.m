% Devin Delfino
% PHYS 228: Scientific Computing
% Assignment 1: Looking for Climate Change, Part 2

% load variables from Assignment 1, part 1
load blue_hills_temperature.tsv
months = blue_hills_temperature(:,1);
temperature_C = blue_hills_temperature(:,3);
years = (months/12)+1960;

num_months = 1:length(years);

for(it=1:12)
	annual_cycle(it) = mean(temperature_C(mod(num_months, 12)==(mod(it,12))));

	% 1. mod(num_months,12) - Performs modular arithmetic of 12 on the vector containing the integers 1 - the number of months recorded (2055)
	% 2. mod(num_months,12)==mod(it,12) - January comprises months 1, 13, 25, ...,  12n+1, so setting the modular arithmetic results == 1 will create a vector of 1's and 0's
	%                            representing which months in the list are January (this will occur for each month as a result of the mod(it,12))
	% 3. temperature_C(mod(num_months, 12)==mod(it,12)) - Uses the vector of 1's and 0's to index into the temperatures recorded in each month, extracting the temperatures recorded in each month
	% 4. mean(temperature_C(mod(num_months, 12)==mod(it,12))) - Takes the mean of the temperatures recorded in each corresponding month
end


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
title('Blue Hills Temperature Anomaly, Seasonal Cycle Removed');
grid;

% Moving Average
Moving_Average(10,years,mon_anomaly, 'Blue Hills');
Moving_Average(5,years,mon_anomaly, 'Blue Hills');
Moving_Average(1,years,mon_anomaly, 'Blue Hills');

Moving_Average(100, years, mon_anomaly, 'Blue Hills');
