%%Program to plot raw data
%Created By: Project Team
%Date: 11 - 03 - 2016

clc
clear all
close all
filein = 'Data\Finger\Input\God\';
str = strcat(filein,'index_on1.lvm');
data = lvm_import(str);
val1 = data.Segment1.data;
s1 = size(val1);
str = strcat(filein,'index_off1.lvm');
data = lvm_import(str);
val2 = data.Segment1.data;
s2 = size(val2);
str = strcat(filein,'middle_on1.lvm');
data = lvm_import(str);
val3 = data.Segment1.data;
s3 = size(val3);
str = strcat(filein,'middle_off1.lvm');
data = lvm_import(str);
val4 = data.Segment1.data;
s4 = size(val4);
str = strcat(filein,'thumb_on1.lvm');
data = lvm_import(str);
val5 = data.Segment1.data;
s5 = size(val5);
str = strcat(filein,'thumb_off1.lvm');
data = lvm_import(str);
val6 = data.Segment1.data;
s6 = size(val6);
s7 = [s1(1) s2(1) s3(1) s4(1) s5(1) s6(1)];
s = min(s7);
val1 = val1(1:s,:);
val2 = val2(1:s,:);
val3 = val3(1:s,:);
val4 = val4(1:s,:);
val5 = val5(1:s,:);
val6 = val6(1:s,:);
% for i = 1:10
    Figure1 = figure;
    subplot(6,1,1)
    plot(val1(:,5));
    title('Index Finger Extension');
    subplot(6,1,2)
    plot(val2(:,5));
    title('Index Finger Flexion');
    subplot(6,1,3)
    plot(val3(:,5));
    title('Middle Finger Extension');
    subplot(6,1,4)
    plot(val4(:,5));
    title('Middle Finger Flexion');
    subplot(6,1,5)
    plot(val5(:,5));
    title('Thumb Extension');
    subplot(6,1,6)
    plot(val6(:,5));
    title('Thumb Flexion');
saveas(Figure1,'SignalGraph.jpg');
%end