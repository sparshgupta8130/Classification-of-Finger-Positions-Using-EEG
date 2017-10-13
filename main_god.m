%Main file for classifying ON/OFF position of finger movement using BPNN
%Created By: RC19
%Date: 09 - 03 - 2016

clc
clear all

 [feat1 text raw] = xlsread('C:\Users\DELL\Downloads\god_train.xls');
 [feat2 text raw] = xlsread('C:\Users\DELL\Downloads\de_train.xls');
 [spec text1 raw1] = xlsread('C:\Users\DELL\Downloads\Target.xls');
 x1 = feat1;
 x2 = feat2;
 t = spec;
 
 max_f1 = max(abs(feat1'));
 max_f2 = max(abs(feat2'));
 [m n] = size(feat1);
 
%  Normalized data
 for i = 1:m
    x1(i,:) = x1(i,:)./max_f1(i);
    x2(i,:) = x2(i,:)./max_f2(i);
 end

train_data_in = [x1(:,10),x2(:,10),x1(:,16:25),x2(:,16:25)];
train_data_t = [t(:,10),t(:,10),t(:,16:25),t(:,16:25)];
test_data = [x1(:,11:15),x2(:,11:15),x1(:,26:30),x1(:,26:30)];

 epoch = 4000; lr = 0.004;
 [v w] = BPNN(train_data_in,train_data_t,epoch,lr);
 
for i = 1:size(test_data,2)
    neth = v'*test_data(:,i);             % net of hidden layer neth(i) = net of ith hidden neuron
    outh = trFcnHid(neth);

    neto = w'*outh;                % net of output layer neto(i) = net of ith output neuron 
    outo = trFcnOut(neto);
    Out(:,i) = outo;
end

