function res=results(Year,SD)

import_data = data_imp(SD);
data(:,1) = datenum(import_data{1});
for i=2:11
    data(:,i) = import_data{i};
end

Startdate = datenum(Year,01,01);
Enddate = datenum(Year,12,31);

js = find(data(:,1)>=Startdate,1,'first');
je = find(data(:,1)<=Enddate,1,'last');

res = data(js:je,2:11);
end