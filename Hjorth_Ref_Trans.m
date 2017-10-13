%%Program to calculate Hjorth Parameters for data after subtracting
%%reference for Translation Action
%Created By: Project Team
%Date: 11 - 03 - 2016

clc
clear all
close all

data_ref = lvm_import('Data\Transl\Input\God\god_trans_ref.lvm');
%data_ref = lvm_import('Data\Transl\Input\De\de_trans_ref.lvm');
val_ref = data_ref.Segment1.data;
s1 = size(val_ref);
ts = 0.005;
%ts = 0.002;
w = 16*pi;
%filein = 'Data\Transl\Input\God\god_';
filein = 'Data\Transl\Input\De\de_';
%fileout = 'Data\Transl\Hjorth_Refer\God\god_';
fileout = 'Data\Transl\Hjorth_Refer\De\de_';
dat = 15;
a = 2*w/((w*ts) + 2);
b = ((w*ts) - 2)/((w*ts) + 2);

for k = 1:dat
    str = strcat(filein,'trans_on',num2str(k),'.lvm');
    %str = strcat(filein,'trans_off',num2str(k),'.lvm');
    data = lvm_import(str);
    val = data.Segment1.data;
    s2 = size(val);
    if s1(1) < s2(1)
        s = s1;
    else
        s = s2;
    end
    val = val(1:s(1),:) - val_ref(1:s(1),:);
    deriv1 = zeros(s(1) - 1,10);
    deriv2 = zeros(s(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'trans_on',num2str(k),'.xls');
    %str1 = strcat(fileout,'trans_off',num2str(k),'.xls');
    xlswrite(str1,HjorthP);
end
