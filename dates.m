function dates=dates(StartYear,EndYear,SD)

data = data_imp(SD);
Dates = datenum(data{1});

Startdate = datenum(StartYear,01,01);
Enddate = datenum(EndYear,12,31);

js = find(Dates>=Startdate,1,'first');
je = find(Dates<=Enddate,1,'last');

dates = Dates(js:je);
end
