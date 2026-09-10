clc; clear all; close all;

load 'Test 12 70C 9 Torr/Data.mat';

IMU_P_XL(:,2:4) = -1*IMU_P_XL(:,2:4);

R_PCM = [0 -1 0; 0 0 1; -1 0 0];
IMU_A_XL(:,2:4) = (R_PCM*IMU_A_XL(:,2:4)')';
IMU_A_GYR(:,2:4) = (R_PCM*IMU_A_GYR(:,2:4)')';

pcm_xl_mean = mean(IMU_A_XL(4000:end, 2:4),1);

g_ang = atand(-pcm_xl_mean(1)/pcm_xl_mean(3));

IMU_A_XL(:,2) = IMU_A_XL(:,2) - sind(g_ang);
IMU_A_XL(:,4) = IMU_A_XL(:,4) + cosd(g_ang);

boom_tip_xl_mean = mean(IMU_P_XL(4000:end,2:4),1);
ax = boom_tip_xl_mean(1);
ay = boom_tip_xl_mean(2);
az = boom_tip_xl_mean(3);

% p = asind(-ax/norm(boom_tip_xl_mean))
% r = atand(ay/az)

% R = [cosd(p) 0 sind(p); 0 1 0; -sind(p) 0 cosd(p)]*[1 0 0; 0 cosd(r) -sind(r); 0 sind(r) cosd(r)];
% IMU_P_XL(:,2:4) = (inv(R)*IMU_P_XL(:,2:4)')';
R = vrrotvec2mat(vrrotvec(boom_tip_xl_mean, [sind(g_ang), 0, -cosd(g_ang)]));
IMU_P_XL(:,2:4) = (R*IMU_P_XL(:,2:4)')';
IMU_P_GYR(:,2:4) = (R*IMU_P_GYR(:,2:4)')';

boom_tip_xl_mean = mean(IMU_P_XL(4000:end,2:4),1);

IMU_P_XL(:,2) = IMU_P_XL(:,2) - boom_tip_xl_mean(1);
IMU_P_XL(:,4) = IMU_P_XL(:,4) - boom_tip_xl_mean(3);

enc_vel = filter(-smooth_diff(75),1,ENCODER(:,2));

IMU_P_XL(:, 2:4) = IMU_P_XL(:, 2:4)*9.81;
vel_x = cumtrapz(IMU_P_XL(1:end,1), IMU_P_XL(1:end,2));
vel_y = cumtrapz(IMU_P_XL(1:end,1), IMU_P_XL(1:end,3));
vel_z = cumtrapz(IMU_P_XL(1:end,1), IMU_P_XL(1:end,4));

figure(1);
plot(IMU_P_XL(:,1), IMU_P_XL(:,2), '.', IMU_P_XL(:,1), IMU_P_XL(:,3), '.', IMU_P_XL(:,1), IMU_P_XL(:,4), '.');
legend('x', 'y', 'z')

figure(2);
plot(IMU_A_XL(:,1), IMU_A_XL(:,2), '.', IMU_A_XL(:,1), IMU_A_XL(:,3), '.', IMU_A_XL(:,1), IMU_A_XL(:,4), '.');
legend('x', 'y', 'z')

figure(3); 
plot(ENCODER(:,1), enc_vel, '.')

figure(4);
plot(IMU_P_GYR(:,1), IMU_P_GYR(:,2), '.', IMU_P_GYR(:,1), IMU_P_GYR(:,3), '.', IMU_P_GYR(:,1), IMU_P_GYR(:,4), '.');
legend('x', 'y', 'z')

figure(5);
plot(IMU_A_GYR(:,1), IMU_A_GYR(:,2), IMU_A_GYR(:,1), IMU_A_GYR(:,3), IMU_A_GYR(:,1), IMU_A_GYR(:,4))
legend('x', 'y', 'z')

figure(6);
plot(IMU_P_XL(1:end,1), vel_x, '.')
figure(7);
plot(IMU_P_XL(1:end,1), vel_y, '.')
figure(8);
plot(IMU_P_XL(1:end,1), vel_z, '.')