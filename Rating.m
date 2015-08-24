function [S,D,Corr] = Rating(Year)

close all
format compact 
format short
directory;

Dir = Dir_C;
% Dir = Dir_D;

S = CalcRating(Year,1);
D = CalcRating(Year,2);

SinglesRating = S(size(S,1),2);
DubbelsRating = D(size(D,1),2);
SR = num2str(SinglesRating,'%0.4f');
DR = num2str(DubbelsRating,'%0.4f');

[Xmin,Xmax,Xs,Xt,Y0] = XLimits(S(:,1),D(:,1),2009);
[Ymin,Ymax,Rmin,Rmax,y,Yt] = YLimits(S(:,2),D(:,2));

PlotFig(1,S(:,1),S(:,2),D(:,1),...
    D(:,2),Xmin,Xmax,Ymin,Ymax,Y0,Xs,Xt,Rmin,Rmax,y,Yt,SR,DR,...
    ['Rating ' num2str(Year)]);

print('-dpdf', [Dir 'rating' num2str(Year-2000,'%02.0f') '.pdf']);

AllSeasons(2009,Year);

% fid = fopen('Corr.txt');
% Corr = textscan(fid, '%s %f %f %f');

% Corr = importdata('Corr.txt');

C = Correlations(2009,Year);
Corr = C{1,2};
% Corr = zeros((2009:Year)+1,4);
% Corr(:,1) = corr_data{1,1};
% Corr(:,2:4) = corr_data{1,2};
end
