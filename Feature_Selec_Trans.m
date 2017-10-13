%%Program to select and organise features to form training data
%Created By: Project Team
%Date: 11 - 03 - 2016

clc
clear all
close all

filein = 'Data\Transl\Hjorth_Refer\God\god_';
%filein = 'Data\Transl\Hjorth_Refer\De\de_';
fileout = 'Data\Transl\Training\god_train.xls';
%fileout = 'Data\Transl\Training\de_train.xls';
dat = 15;
n = 6;
f = 6;
c = 2;
traindat = zeros(f*n,c*dat);

for k = 1:dat
    l = 1;
    str = strcat(filein,'trans_on',num2str(k),'.xls');
    [num text row] = xlsread(str);
    for j = 1:10
        if j == 1 || j == 5 || j == 6 || j == 8
            continue
        end
        for i = 1:f
            traindat(l,k) = num(i,j);
            l = l + 1;
        end
    end
end

for k = 1:dat
    l = 1;
    str = strcat(filein,'trans_off',num2str(k),'.xls');
    [num text row] = xlsread(str);
    for j = 1:10
        if j == 1 || j == 5 || j == 6 || j == 8
            continue
        end
        for i = 1:f
            traindat(l,k+dat) = num(i,j);
            l = l + 1;
        end
    end
end


xlswrite(fileout,traindat);

targetdat = [ones(1,dat) zeros(1,dat);
             zeros(1,dat) ones(1,dat)];

xlswrite('Data\Transl\Training\Target.xls',targetdat);