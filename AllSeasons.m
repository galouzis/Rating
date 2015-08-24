function [S,D] = AllSeasons(StartYear,EndYear)

format short
directory;

Dir = Dir_C;
% Dir = Dir_D;

S = [;];
D = [;];

Years = StartYear:EndYear;
for i = 1:length(Years)
    S = cat(1,S,CalcRating(Years(i),1));
    D = cat(1,D,CalcRating(Years(i),2));
end

SinglesRating = S(size(S,1),2);
DubbelsRating = D(size(D,1),2);
SR = num2str(SinglesRating,'%0.4f');
DR = num2str(DubbelsRating,'%0.4f');

n = i+1;
[Xmin,Xmax,Xs,Xt,Y0] = XLimits(S(:,1),D(:,1),Years);
[Ymin,Ymax,Rmin,Rmax,y,Yt] = YLimits(S(:,2),D(:,2));

PlotFig(n,S(:,1),S(:,2),D(:,1),D(:,2),Xmin,Xmax,Ymin,Ymax,...
    Y0,Xs,Xt,Rmin,Rmax,y,Yt,SR,DR,'Overall rating development');

print('-dpdf', [Dir 'Dev' num2str(EndYear) '.pdf']);

end
