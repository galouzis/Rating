function R=CalcRating(Year,SD)

R(:,1) = [datenum(Year,01,01);dates(Year,Year,SD)];
r = results(Year,SD);
R(1,2) = InitRating(Year,SD);

ks=0;
for j = 1:size(R,1)-1
    ks = ks + nnz(r(j,:));
    if ks < 7
        R(j+1,2) = ((6-ks)*R(1,2) + sum(sum(r(1:j,:))))/6;
    else
        R(j+1,2) = sum(sum(r(1:j,:)))/ks;
    end
end
end