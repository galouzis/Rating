function corr = Correlations(StartYear,EndYear)

format short
directory;

Dir = Dir_C;
% Dir = Dir_D;

S = [;];
D = [;];

% StartYear = 2009;
% EndYear = 2013;

Years = StartYear:EndYear;
for i = 1:length(Years)
    S = cat(1,S,CalcRating(Years(i),1));
    D = cat(1,D,CalcRating(Years(i),2));
end

DatesTot = min(cat(1,S,D),[],1):max(cat(1,S,D),[],1);
Stot = zeros(length(DatesTot),2);
Stot(:,1) = DatesTot;
Dtot = zeros(length(DatesTot),2);
Dtot(:,1) = DatesTot;
i=1;
for j=1:length(DatesTot)
    if S(i,1)==DatesTot(j)
        Stot(j,2) = S(i,2);
        i=i+1;
    elseif DatesTot(j)>S(i-1,1) && DatesTot(j)<S(i,1)
        Stot(j,2) = Stot(j-1,2);
    end
    if i>size(S,1)
        break
    end
end
i=1;
for j=1:length(DatesTot)
    if D(i,1)==DatesTot(j)
        Dtot(j,2) = D(i,2);
        i=i+1;
    elseif DatesTot(j)>D(i-1,1) && DatesTot(j)<D(i,1)
        Dtot(j,2) = Dtot(j-1,2);
    end
    if i>size(D,1)
        break
    end
end

Rtot = cat(2,Stot,Dtot(:,2));
Sc = zeros(2,2,length(Years)+1);
Dc = zeros(2,2,length(Years)+1);
SDc = zeros(2,2,length(Years)+1);
Corr = cell(length(Years)+1,4);
for i = 1:length(Years)
    ind_min = find(str2num(datestr(Rtot(:,1),10)) == Years(i),1,'first');
    ind_max = find(str2num(datestr(Rtot(:,1),10)) == Years(i),1,'last');
    Sc(:,:,i) = corrcoef(Rtot(ind_min:ind_max,[1,2]));
    Dc(:,:,i) = corrcoef(Rtot(ind_min:ind_max,[1,3]));
    SDc(:,:,i) = corrcoef(Rtot(ind_min:ind_max,[2,3]));
    Corr(i,:) = {num2str(Years(i)),Sc(1,2,i),Dc(1,2,i),SDc(1,2,i)};
end
Sc(:,:,i+1) = corrcoef(Rtot(:,[1,2]));
Dc(:,:,i+1) = corrcoef(Rtot(:,[1,3]));
SDc(:,:,i+1) = corrcoef(Rtot(:,[2,3]));
Corr(i+1,:) = {[num2str(Years(1)) '-' num2str(Years(i))],...
    Sc(1,2,i+1),Dc(1,2,i+1),SDc(1,2,i+1)};

% Scov = cov(Rtot(:,[1,2]));
% Dcov = cov(Rtot(:,[1,3]));
% SDcov = cov(Rtot(:,[2,3]));

fid = fopen([Dir 'Corr.txt'],'w');
% fprintf(fid,'%6s %12s %8s %8s\r\n','Year','Single','Double','S-D');
% fprintf(fid,'%6s %12.5f %9.5f %9.5f\r\n', Corr');
% fprintf(fid,'%1s %9.5f %9.5f %9.5f\r\n', Corr_tot{:});
fprintf(fid,'%6s %11s %9s %8s\r\n','Year','Single','Double','S-D');
%fprintf(fid,'%s %0.5f %0.5f %0.5f\r\n', Corr','delimiter','\t');
for r=1:length(Corr)-1
    fprintf(fid,'%6s %12.5f %9.5f %9.5f\r\n', Corr{r,:});
end
fprintf(fid,'%1s %9.5f %9.5f %9.5f\r\n', Corr{r+1,:});
fclose(fid);

% corr = importdata('Corr.txt');
fid = fopen('Corr.txt');
corr_head = textscan(fid,'%s',4);
corr = textscan(fid, '%s %f %f %f',length(Years)+1,'CollectOutput',1);
%corr_data2 = textscan(fid, '%s %f %f %f',1);
end