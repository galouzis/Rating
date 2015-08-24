function EndRating = EndRating(Year,SD)
 
R = CalcRating(Year,SD);
EndRating = R(size(R,1),2);
end