clear;
clc;
load('D:\DCGAN\program\tec2011_2.mat');

x = lon(:,1);
y = lat(:,1);
z = tec(:,1);
vq = [];

[xq,yq] = meshgrid(-180:1:180,-90:1:90);
vz = griddata(x,y,z,xq,vq);
pcolor(xq,yq,vz);
figure;
