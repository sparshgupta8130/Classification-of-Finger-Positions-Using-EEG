%%Program to Plot Continuous Signal
%Created By: Project Team
%Date: 23-08-2016

clc
clear all
close all

filein1 = 'Data\Finger\Training\traindata.xlsx';
filein2 = 'Data\Finger\Training\traintarget_finger.xlsx';
filein3 = 'Data\Finger\Training\traintarget_onoff.xlsx';
filein4 = 'Data\Finger\Training\Cont_Ind_Train.xlsx';
filein5 = 'Data\Finger\Training\Cont_Ind_Test.xlsx';
n = 50;  %number of hidden neurons

[num text row] = xlsread(filein1);
X = num;
[num text row] = xlsread(filein2);
T1 = num;
[num text row] = xlsread(filein3);
T2 = num;

net2 = feedforwardnet(n,'trainlm');
%net2.layers{1}.transferFcn = 'logsig';
%net2.layers{2}.transferFcn = 'logsig';
net2.trainParam.epochs = 10000;
[net2,tr2] = train(net2,X,T2);

[num text row] = xlsread(filein4);
Y = num;
[num text row] = xlsread(filein5);
Y1 = num;
out = net2(Y);

for i = 1:length(out)
    if out(i) > 0.4
        out(i) = 1;
    else
        out(i) = 0;
    end
end

X1 = 0.03:0.03:8.58;
figure(1)
plot(X1,Y1,'b');
hold on
ylim([0 2]);
plot(X1,out,'r');
