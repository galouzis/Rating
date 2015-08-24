function InitRating = InitRating(Year,SD)

if Year == 2010
    r = -0.3;
elseif Year == 2011
    r = -0.2;
else
    r = 0;
end

if Year == 2009
    if SD == 1
        InitRating = 7.6361;
    elseif SD == 2
        InitRating = 6.7684;
    end
else
    EndR = EndRating(Year-1,SD);
    InitRating = EndR+r;
end
end