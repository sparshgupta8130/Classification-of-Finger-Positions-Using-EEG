filein1 = 'Data\Finger\Training\Cont_Ind_Train_2.xlsx';
filein2 = 'Data\Finger\Training\Cont_Test.xlsx';
[num text row] = xlsread(filein1);
Y = num;
[num text row] = xlsread(filein2);
Y1 = num;
out1 = net2(Y);

for i = 1:length(out1)
    if out1(i) > 0.6
        out1(i) = 90;
    else
        out1(i) = 0;
    end
end

l = length(out1);
n = 1;
for i = 1:l-n
    out1(l+1-i) = out1(l+1-i-n);
end
for i = 1:n
    out1(i) = 0;
end

filein1 = 'Data\Finger\Training\Cont_Mid_Train_2.xlsx';
filein2 = 'Data\Finger\Training\Cont_Test.xlsx';
[num text row] = xlsread(filein1);
Y = num;
[num text row] = xlsread(filein2);
Y2 = num;
out2 = net2(Y);
for i = 1:length(out2)
    if out2(i) > 0.6
        out2(i) = 90;
    else
        out2(i) = 0;
    end
end

l = length(out2);
n = 1;
for i = 1:l-n
    out2(l+1-i) = out2(l+1-i-n);
end
for i = 1:n
    out2(i) = 0;
end

filein1 = 'Data\Finger\Training\Cont_Thu_Train_2.xlsx';
filein2 = 'Data\Finger\Training\Cont_Test.xlsx';
[num text row] = xlsread(filein1);
Y = num;
[num text row] = xlsread(filein2);
Y3 = num;
out3 = net2(Y);
for i = 1:length(out3)
    if out3(i) > 0.6
        out3(i) = 90;
    else
        out3(i) = 0;
    end
end

l = length(out3);
n = 1;
for i = 1:l-n
    out3(l+1-i) = out3(l+1-i-n);
end
for i = 1:n
    out3(i) = 0;
end

X1 = 0.03:0.03:8.58;
figure(1)
title('Index Finger');
legend('Input Signal','Output Signal from NN');
plot(X1,Y1,'b');
hold on
ylim([0 180]);
plot(X1,out1,'r');

figure(2)
title('Middle Finger');
legend('Input Signal','Output Signal from NN');
plot(X1,Y2,'b');
hold on
ylim([0 180]);
plot(X1,out2,'r');

figure(3)
title('Thumb');
legend('Input Signal','Output Signal from NN');
plot(X1,Y3,'b');
hold on
ylim([0 180]);
plot(X1,out3,'r');