%%Program to train the Neural Network
%Created By: Project Team
%Date: 11 - 03 - 2016

clc
clear all
close all

%filein = 'Data\Transl\Training\god_train.xls';
filein = 'Data\Transl\Training\de_train.xls';
%filein = 'Data\Transl\Training\combined.xls';
tfilein = 'Data\Transl\Training\Target.xls';
%tfilein = 'Data\Transl\Training\Targetc.xls';

[num text row] = xlsread(filein);
X = num;
[num text row] = xlsread(tfilein);
T = num;
% [num text row] = xlsread(fileintes);
% Y = num;

net = feedforwardnet(10,'traingdm');
net.trainParam.epochs = 7000;
%net.trainParam.lr = 0.005;
[net,tr] = train(net,X,T);
out = net(X);
perf = perform(net,T,out);

dat = 15;

for j = 1:2*dat
    M = max(out(:,j));
    for i = 1:2
        if out(i,j) == M
            out(i,j) = 1;
        else
            out(i,j) = 0;
        end
    end
end

% for j = 1:4*dat
%     M = max(out(:,j));
%     for i = 1:2
%         if out(i,j) == M
%             out(i,j) = 1;
%         else
%             out(i,j) = 0;
%         end
%     end
% end