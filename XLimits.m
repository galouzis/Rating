function [Xmin,Xmax,Xs,Xt,Y0]=XLimits(datesS,datesD,Years)

Xc = min([datesS;datesD]);
Xl = max([datesS;datesD]);
Xt = length(datestr(Xc:31:Xl,12))+1;
if Xt < 9
    Xs = 1;
elseif Xt <= 13
    Xs = 2;
elseif length(Years) < 13
    Xs = 12.*(floor((length(Years)-1)/12)+1)/floor(12/length(Years));
else
    Xs = 12.*(floor((length(Years)-1)/12)+1);
end
Y0 = str2double(datestr(Xc,10));
Xm = datenum(Y0,1:Xs:Xt+Xs,1)-Xc;
im = find(Xm<=0,1,'last');
Xmin = Xc-Xm(im)-15;
Xm = datenum(Y0,1:Xs:Xt+Xs,1)-Xl;
im = find(Xm>=0,1);
Xmax = Xl+Xm(im)+15;

end