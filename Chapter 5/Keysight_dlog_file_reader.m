clc, clear all, close all

[fileName, Path] = uigetfile('*.dlog');
fileID = fopen([Path, fileName], 'r');
tmp = fread(fileID, Inf, "uint8", 0, "ieee-le");
idx = find(tmp==10,20);
fclose(fileID);

fileID = fopen([Path, fileName], 'r');
tmp = fread(fileID, idx(end), "uint8", 0, "ieee-le");
data = fread(fileID, Inf, "int32", 0, "ieee-le");
data = data*1e-5;
data_size = length(data)/4;

V_3_3 = data(1:data_size);
I_3_3 = data(data_size+1:2*data_size);
P_3_3 = V_3_3.*I_3_3;

V_5_0 = data(2*data_size+1:3*data_size);
I_5_0 = data(3*data_size+1:4*data_size);
P_5_0 = V_5_0.*I_5_0;

T = [1:1:data_size]*0.2/60;

figure(1);
plot(T, P_3_3, '.', T, P_5_0, '.');
figure(2);
plot(T, I_3_3, '.', T, I_5_0, '.');

P_cons = sum(P_5_0.*0.2/3600) + sum(P_3_3.*0.2/3600);