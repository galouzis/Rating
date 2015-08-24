function [Ymin,Ymax,Rmin,Rmax,y,Yt]=YLimits(RatingS,RatingD)

L = max([RatingS; RatingD])-min([RatingS; RatingD]);
if L < 0.9
    y = 0.1;
    Rmin = floor(min([RatingS; RatingD])/y)*y;
    Rmax = ceil(max([RatingS; RatingD])/y)*y;
    Yt = num2str((Rmin:y:Rmax)','%0.1f\n');
elseif L < 1.8
    y = 0.2;
    Rmin = floor(min([RatingS; RatingD])/y)*y;
    Rmax = ceil(max([RatingS; RatingD])/y)*y;
    Yt = num2str((Rmin:y:Rmax)','%0.1f\n');
elseif L < 2.4
    y = 0.25;
    Rmin = floor(min([RatingS; RatingD])/y)*y;
    Rmax = ceil(max([RatingS; RatingD])/y)*y;
    Yt = num2str((Rmin:y:Rmax)','%0.2f\n');
else
    y = 0.5;
    Rmin = floor(min([RatingS; RatingD])/y)*y;
    Rmax = ceil(max([RatingS; RatingD])/y)*y;
    Yt = num2str((Rmin:y:Rmax)','%0.1f\n');
end
Ymax = Rmax+0.2*y;
Ymin = Rmin-0.2*y;

end