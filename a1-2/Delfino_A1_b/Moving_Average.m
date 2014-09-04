% Moving_Average Function

function [x, y] = Moving_Average(year_range, years, anom, loc)

	month_range = year_range*12;
	half_mRange = month_range/2;
	% x = years(years>=(range/2)+years(1))
	% x = x(years<=(range/2)years(end)-)
	x = years(half_mRange:(end-half_mRange));

	for(it=1:length(x))
		temp_win = it:(month_range+(it-1));
		y(it) = mean(anom(temp_win));
	end

	figure;
	plot(x,y)
	ylabel('Temperature Anomaly (C)');
	xlabel('Year');
	title(strcat(loc,' Temperature Anomaly, Seasonal Cycle Removed, ',num2str(year_range),'-Year Moving Average'));
	grid;
