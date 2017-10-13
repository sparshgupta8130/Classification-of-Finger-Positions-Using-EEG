clc
clear all

 [meas text raw] = xlsread('Meas_Fisheriris.xls');
 [spec text1 raw1] = xlsread('Species_Fisheriris.xls');
 x = meas';
 t = spec';
 
 in = [x(:,1:40),x(:,51:90),x(:,101:140)];
 tg = [t(:,1:40),t(:,51:90),t(:,101:140)];
epoch = 1000; lr = 0.6;
% in = -10:0.5:10;
% tg = in.^3;
% in = in./10;
% tg = tg./1000;
 [v w] = BPNN(in,tg,epoch,lr);
 test = [x(:,41:50),x(:,91:100),x(:,141:150)];
% test = [pi/2,0,pi/4,2*pi/3,3*pi/2,3*pi/4,2*pi];
%  test = in;
for i = 1:length(test)
    neth = v'*test(:,i);             % net of hidden layer neth(i) = net of ith hidden neuron
    outh = trFcnHid(neth);

    neto = w'*outh;                % net of output layer neto(i) = net of ith output neuron 
    outo = trFcnOut(neto);
    Out(:,i) = outo;
end