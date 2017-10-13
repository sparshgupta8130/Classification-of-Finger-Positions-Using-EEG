%Main program to predict the output of a dynamic system
%Created By: RC19
%Date: 04 - 03 - 2016


clc
clear all

d(1) = 0.5;
p = zeros(3,1000);
p(3,:) = 1;
for k = 1:1000
    u(k) = 2*rand-1;
    d(k+1) = d(k)/(1+d(k)*d(k)) + u(k)*u(k)*u(k);
    p(1,k) = u(k);  p(2,k) = d(k);
    t(k) = d(k+1);
end

tnorm = t./(1.5);

epoch = 1000; lr = 0.1;

[v w] = BPNN(p,tnorm,epoch,lr);

test = p;
for i = 1:length(test)
    neth = v'*test(:,i);             % net of hidden layer neth(i) = net of ith hidden neuron
    outh = trFcnHid(neth);

    neto = w'*outh;                % net of output layer neto(i) = net of ith output neuron 
    outo = trFcnOut(neto);
    Out(:,i) = outo;
end

plot(tnorm);
hold on
plot(Out,'r');