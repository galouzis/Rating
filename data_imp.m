function dat=data_imp(SD)

if SD == 1;
    fid = fopen('GameResultsS.txt');
elseif SD == 2
    fid = fopen('GameResultsD.txt');
end

dat = textscan(fid, '%s %f %f %f %f %f %f %f %f %f %f %s',....
        'delimiter', '\t');
fclose(fid);
end