clc; clear; close all;
%%
addpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Geometry Sensitivity Paper'))
addpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\barycentric_forms'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\lr_paaa'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\paaa'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\sv_paaa'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\utils'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\paaa-LB'))
%%
set(0, 'defaultaxesfontsize',14,'defaultaxeslinewidth',1.0,...
    'defaultlinelinewidth',3.0,'defaultpatchlinewidth',1.0,...
    'defaulttextfontsize',18,'DefaultLineMarkerSize',14);
%%
%Import Input and Output Data

% 
% vel_0_24g_1=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_24_g_f1_vel.txt',Range="B8:B262151");
% vel_0_24g_2=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_24_g_f2_vel.txt',Range="B8:B262151");
% vel_0_24g_3=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_24_g_f3_vel.txt',Range="B8:B262151");
% 
% acc_0_24g_1=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_24_g_f1_accel_2.txt',Range="B6:B262149");
% acc_0_24g_2=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_24_g_f2_accel.txt',Range="B8:B262151");
% acc_0_24g_3=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_24_g_f3_accel.txt',Range="B8:B262151");
% 
% vel_0_4g_1=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_4_g_f1_vel.txt',Range="B8:B262151");
% vel_0_4g_2=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_4_g_f2_vel.txt',Range="B8:B262151");
% vel_0_4g_3=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_4_g_f3_vel.txt',Range="B8:B262151");
% 
% acc_0_4g_1=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_4_g_f1_accel.txt',Range="B8:B262151");
% acc_0_4g_2=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_4_g_f2_accel.txt',Range="B8:B262151");
% acc_0_4g_3=readmatrix('Shaker Table Tests/Polytec Input and Output Data/0_4_g_f3_accel.txt',Range="B8:B262151");

% 0.05 g Load

[time,vel_0_05g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_05g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_05g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_05g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_05g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_05g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% 0.1 g Load

[time,vel_0_1g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_1g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_1g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_1g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_1g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_1g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% 0.15 g Load

[time,vel_0_15g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_15g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_15g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_15g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_15g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_15g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% 0.2 g Load

[time,vel_0_2g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_2g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_2g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_2g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_2g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_2g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
% 0.25 g Load
[time,vel_0_25g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_25g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_25g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_25g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_25g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_25g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% 0.3 g Load
[time,vel_0_3g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_3g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_3g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_3g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_3g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_3g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% % 0.33 g Load
% [time,vel_0_33g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_sweep_0_33g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_33g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_sweep_0_33g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_33g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_sweep_0_33g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);

% 0.35 g Load
[time,vel_0_35g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_35g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_35g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_35g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_35g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_35g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% 0.38 g Load
[time,vel_0_38g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_38g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_38g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_38g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_38g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_38g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% 0.4 g Load
[time,vel_0_4g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_4g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_4g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_4g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_4g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_4g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% 0.45 g Load
[time,vel_0_45g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_45g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_45g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_45g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);
[time,vel_0_45g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_45g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Vib','Velocity','Samples',0,0);

% 
% % 0.36 g Load
% [time,vel_0_36g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_36g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_36g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_36g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_36g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_36g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);
% 
% % 0.38 g Load
% [time,vel_0_38g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_38g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_38g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_38g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_38g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_38g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);
% 
% % 0.42 g Load
% [time,vel_0_42g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_42g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_42g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_42g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_42g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_42g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);
% 
% % 0.45 g Load
% [time,vel_0_45g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_45g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_45g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_45g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_45g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_45g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);
% 
% % 0.48 g Load
% [time,vel_0_48g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_48g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_48g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_48g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_48g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_48g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);

% [time,vel_0_41g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_41g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_41g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);

% [time,vel_0_41g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_41g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_41g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_43g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_43g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_43g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_43g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Vib','Velocity','Samples',0,0);
% [time,vel_0_43g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_43g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Vib','Velocity','Samples',0,0);
% 
% 
% [time,acc_0_41g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_41g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_41g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_41g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_43g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_43g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_43g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_43g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_43g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_43g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Ref1','Acceleration','Samples',0,0);
% 0.05 g Load
[time,acc_0_05g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_05g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_05g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_05g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_05g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_05g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.1 g Load
[time,acc_0_1g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_1g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_1g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_1g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_1g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_1g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.15 g Load
[time,acc_0_15g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_15g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_15g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_15g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_15g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_15g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.2 g Load
[time,acc_0_2g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_2g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_2g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_2g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_2g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_2g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.25 g Load
[time,acc_0_25g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_25g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_25g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_25g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_25g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_25g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.3 g Load
[time,acc_0_3g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_3g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_3g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_3g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_3g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_3g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.35 g Load
[time,acc_0_35g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_35g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_35g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_35g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_35g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_35g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.38 g Load
[time,acc_0_38g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_38g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_38g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_38g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_38g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_38g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.4 g Load
[time,acc_0_4g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_4g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_4g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_4g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_4g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_4g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);

% 0.45 g Load
[time,acc_0_45g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_45g_test_1_28kHz_SR_0_40Hz_f1_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_45g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_45g_test_1_28kHz_SR_0_40Hz_f2_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);
[time,acc_0_45g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data New Tests/Sine_0_45g_test_1_28kHz_SR_0_40Hz_f3_0_05Hzs.svd','Time','Ref1','Acceleration','Samples',0,0);


% % 0.38 g Load
% [time,acc_0_38g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_38g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_38g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_38g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_38g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_38g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Ref1','Acceleration','Samples',0,0);
% 
% % 0.42 g Load
% [time,acc_0_42g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_42g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_42g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_42g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_42g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_42g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Ref1','Acceleration','Samples',0,0);
% 
% % 0.45 g Load
% [time,acc_0_45g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_45g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_45g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_45g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_45g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_45g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Ref1','Acceleration','Samples',0,0);
% 
% % 0.48 g Load
% [time,acc_0_48g_1]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_48g_smoothfilterCI_256Hz_slow_0_100Hz_f1.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_48g_2]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_48g_smoothfilterCI_256Hz_slow_0_100Hz_f2.svd','Time','Ref1','Acceleration','Samples',0,0);
% [time,acc_0_48g_3]=GetPointData('Shaker Table Tests/Polytec Input and Output Data/Sine_sweep_0_48g_smoothfilterCI_256Hz_slow_0_100Hz_f3.svd','Time','Ref1','Acceleration','Samples',0,0);


% acc_0_24g=[acc_0_24g_1';acc_0_24g_2';acc_0_24g_3'];
% vel_0_24g=[vel_0_24g_1';vel_0_24g_2';vel_0_24g_3'];
% acc_0_4g=[acc_0_4g_1';acc_0_4g_2';acc_0_4g_3'];
% vel_0_4g=[vel_0_4g_1';vel_0_4g_2';vel_0_4g_3'];
% acc_0_41g=[acc_0_41g_1;acc_0_41g_2;acc_0_41g_3];
% vel_0_41g=[vel_0_41g_1;vel_0_41g_2;vel_0_41g_3];
% acc_0_43g=[acc_0_43g_1;acc_0_43g_2;acc_0_43g_3];
% vel_0_43g=[vel_0_43g_1;vel_0_43g_2;vel_0_43g_3];

% 0.05 g Load
acc_0_05g = [acc_0_05g_1; acc_0_05g_2; acc_0_05g_3];
vel_0_05g = [vel_0_05g_1; vel_0_05g_2; vel_0_05g_3];

% 0.1 g Load
acc_0_1g = [acc_0_1g_1; acc_0_1g_2; acc_0_1g_3];
vel_0_1g = [vel_0_1g_1; vel_0_1g_2; vel_0_1g_3];

% 0.15 g Load
acc_0_15g = [acc_0_15g_1; acc_0_15g_2; acc_0_15g_3];
vel_0_15g = [vel_0_15g_1; vel_0_15g_2; vel_0_15g_3];

% 0.2 g Load
acc_0_2g = [acc_0_2g_1; acc_0_2g_2; acc_0_2g_3];
vel_0_2g = [vel_0_2g_1; vel_0_2g_2; vel_0_2g_3];

% 0.25 g Load
acc_0_25g = [acc_0_25g_1; acc_0_25g_2; acc_0_25g_3];
vel_0_25g = [vel_0_25g_1; vel_0_25g_2; vel_0_25g_3];

% 0.3 g Load
acc_0_3g = [acc_0_3g_1; acc_0_3g_2; acc_0_3g_3];
vel_0_3g = [vel_0_3g_1; vel_0_3g_2; vel_0_3g_3];

% 0.35 g Load
acc_0_35g = [acc_0_35g_1; acc_0_35g_2; acc_0_35g_3];
vel_0_35g = [vel_0_35g_1; vel_0_35g_2; vel_0_35g_3];

% 0.38 g Load
acc_0_38g = [acc_0_38g_1; acc_0_38g_2; acc_0_38g_3];

%vel_0_38g_1(60000:64001)=filloutliers(vel_0_38g_1(60000:64001),"spline","movmean",5);
vel_0_38g = [vel_0_38g_1; vel_0_38g_2; vel_0_38g_3];

% 0.4 g Load
acc_0_4g = [acc_0_4g_1; acc_0_4g_2; acc_0_4g_3];
vel_0_4g = [vel_0_4g_1; vel_0_4g_2; vel_0_4g_3];

% 0.45 g Load
acc_0_45g = [acc_0_45g_1; acc_0_45g_2; acc_0_45g_3];
vel_0_45g = [vel_0_45g_1; vel_0_45g_2; vel_0_45g_3];


% acc_all=cat(3,acc_0_24g,acc_0_4g,acc_0_41g,acc_0_43g);
% vel_all=cat(3,vel_0_24g,vel_0_4g,vel_0_41g,vel_0_43g);
acc_all = cat(3, acc_0_05g, acc_0_1g, acc_0_15g, acc_0_2g, acc_0_25g, acc_0_3g, acc_0_35g, acc_0_38g, acc_0_4g, acc_0_45g);

vel_all = cat(3, vel_0_05g, vel_0_1g, vel_0_15g, vel_0_2g, vel_0_25g, vel_0_3g, vel_0_35g, vel_0_38g, vel_0_4g, vel_0_45g);

%vel_all = clip(cat(3, vel_0_24g, vel_0_27g, vel_0_3g, vel_0_33g, vel_0_36g, vel_0_38g, vel_0_4g, vel_0_41g, vel_0_42g, vel_0_43g, vel_0_45g, vel_0_48g),-1.2,1.2);

levels=[0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.38,0.4,0.45];
% Define the number of repeated test runs
num_runs = 3;
num_levels = length(levels);
target_freq = 3; 

% --- Specify your exact folder path here ---
folder_path = 'Shaker Table Tests\Input Frequency vs Time Data New Tests'; 

crossover_times_seconds = NaN(num_levels, num_runs);

for i = 1:num_levels
    level_str = strrep(sprintf('%g', levels(i)), '.', '_');
    
    for r = 1:num_runs
        filename = sprintf('%sg_%d.txt', level_str, r);
        full_path = fullfile(folder_path, filename);
        
        if isfile(full_path)
            
            % 1. Detect options and force Column 1 to be read as a string
            opts = detectImportOptions(full_path);
            opts.VariableTypes{1} = 'string'; 
            opts.VariableTypes{2} = 'double';
            
            % Read the table
            data = readtable(full_path, opts);
            
            % 2. Convert HH:MM:SS.FFF strings into total elapsed seconds
            t_strings = data{:, 1};
            t_seconds = seconds(duration(t_strings, 'InputFormat', 'hh:mm:ss.SSS'));
            f_prof = data{:, 2};
            
            % 3. Find first index where frequency is >= 3 Hz
            idx = find(f_prof >= target_freq, 1, 'first');
            
            if ~isempty(idx)
                % Calculate elapsed time from the very start of the file
                elapsed_time = t_seconds(idx) - t_seconds(1);
                crossover_times_seconds(i, r) = elapsed_time;
            end
        end
    end
end




% for k=1:num_levels
%     acc_all[:,:,k]=[]
% end
% Initialize the running totals for the power spectra

Ts = mean(diff(time));
Fs = 1/Ts;
Fn = Fs/2;
L = numel(time);
 % Extract Single-Sided Spectrum for Plotting
    % Using your exact frequency vector logic
    Fv = linspace(0, 1, fix(L/2)+1) * Fn;
    Iv = 1:numel(Fv);

for k=1:num_levels
   
    for i = 1:num_runs
        
        

        % Basic time and frequency parameters
        
        
        x = acc_all(i,:,k);  % Input Acceleration
        y = vel_all(i,:,k); % Output Velocity
        
        t_cross = crossover_times_seconds(k, i);
        sample_cutoff(i,k) = round(t_cross * Fs);
        % cutoff_idx_accel = min(sample_cutoff, size(x, 2));
        % cutoff_idx_vel   = min(sample_cutoff, size(y, 2));

        x(1:sample_cutoff(i,k)) = 0;
        y(1:sample_cutoff(i,k)) = 0;
        acc_all(i,:,k)=x;
        vel_all(i,:,k)=y;


    end
end
for k=1:10
        figure(1)
        plot_label = ['Load: ', num2str(levels(k)), ' g'];
        
        plot(time,acc_all(1,:,k), 'DisplayName', plot_label);
        hold on
        legend('show', 'Location', 'best');
        xlabel('Time (s)');
        ylabel('Acceleration Magnitude ((m/s^2)');
        grid on
end
title('Input Sine Sweep Acceleration (Time Domain)')
hold off

for k=1:10
        figure(2)
        plot_label = ['Load: ', num2str(levels(k)), ' g'];

        plot(time,vel_all(2,:,k), 'DisplayName', plot_label);
        hold on
        legend('show', 'Location', 'best');
        xlabel('Time (s)');
        ylabel('Velocity Magnitude ((m/s)');
        grid on
end
title('Output Velocity (Time Domain)')

hold off

for k=1:num_levels
    Sxx_sum = 0;
    Sxy_sum = 0;
    Syy_sum = 0;

    for i = 1:num_runs
    
        x = acc_all(i,:,k);  % Input Acceleration
        y = vel_all(i,:,k); % Output Velocity
        
        % Mean-correct signals to eliminate the 0 Hz DC offset
        x_m = x - mean(x);
        y_m = y - mean(y);
        
        % 2. Calculate the complex Fourier Transforms
        X = fft(x_m) / L;
        Y = fft(y_m) / L;
        
        %X=smoothdata(X,"movmean",50);
        % 3. Compute Auto-Power (Sxx) and Cross-Power (Sxy) Spectra
        % conj(X) returns the complex conjugate of the input array
        Sxx = conj(X) .* X;
        Sxy = conj(X) .* Y;
        Syy = conj(Y) .* Y;
        % 4. Accumulate the spectra into the running totals
        Sxx_sum = Sxx_sum + Sxx;
        Sxy_sum = Sxy_sum + Sxy;
        Syy_sum = Syy_sum + Syy;
        % Define window parameters for Welch's Method
        % window_length = 2048; % Higher number = better frequency resolution, but more variance
        % overlap = window_length / 2; % 50% overlap is standard
        % 
        % Calculate H1 directly from time domain signals
        %[H1_single_sided_welch(:,k), ~] = tfestimate(x_m, y_m, hanning(window_length), overlap, window_length, 256);
        X_all(i,k,:)=X;
        Y_all(i,k,:)=Y;
    end
    
    % 5. Calculate the Averaged H1 Transfer Function
    H1_full = Sxy_sum ./ Sxx_sum;
    H2_full = Syy_sum ./ Sxy_sum;
    % Extract Single-Sided Spectrum for Plotting
    % Using your exact frequency vector logic
    Fv = linspace(0, 1, fix(L/2)+1) * Fn;
    Iv = 1:numel(Fv);
    
    % Extract the valid single-sided FRF
    H1_single_sided(:,k) = H1_full(Iv);
    H2_single_sided(:,k) = H2_full(Iv);

    
    % Plot the Magnitude
    figure(3)
    plot_label = ['Load: ', num2str(levels(k)), ' g'];
    plot(Fv, abs(H1_single_sided(:,k)), 'LineWidth', 1.5, 'DisplayName', plot_label);
    hold on
    title('Averaged Frequency Response Function (H_1)');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude ((m/s)/(m/s^2))');
    grid on;
    xlim([3, 40]);
    
    % Set y-axis to logarithmic for clear modal visualization
    set(gca, 'YScale', 'log'); 
    legend('show', 'Location', 'best');
    
end
hold off
%%
for k=1:10
    for i=2
        figure(4)
        plot_label = ['Load: ', num2str(levels(k)), ' g'];
        % X_all(i,k,Iv)=smoothdata(abs((X_all(i,k,Iv))),"movmedian",20);
        X_all(i,k,23000:25000)=filloutliers(abs(X_all(i,k,23000:25000)),"spline");
        % X_all(i,k,4500:6000)=smoothdata(abs((X_all(i,k,4500:6000))),"movmean",50);
        % X_all(i,k,7000:9000)=smoothdata(abs((X_all(i,k,7000:9000))),"movmean",50);

        semilogy(Fv, abs(squeeze(X_all(i,k,Iv))), 'LineWidth', 1.5,'DisplayName', plot_label);
        hold on
        title('Input Sine Sweep Acceleration (Frequency Domain)');
        xlabel('Frequency (Hz)');
        ylabel('Magnitude (m/s^2)');
        grid on
    end
end
xlim([3 30])
hold off
legend('show', 'Location', 'best');
%%

for k=1:10
    for i=2
        figure(5)
                plot_label = ['Load: ', num2str(levels(k)), ' g'];

        semilogy(Fv, abs(squeeze(Y_all(i,k,Iv))), 'LineWidth', 1.5,'DisplayName', plot_label);
        hold on
        title('Output Velocity (Frequency Domain)');
        xlabel('Frequency (Hz)');
        ylabel('Magnitude (m/s)');
        grid on
    end
end
xlim([3 40])
hold off
legend

for k=1:10
    for i=2
        FRF=Y_all(i,k,Iv)./smoothdata(X_all(i,k,Iv),"movmedian",20);
        figure(6)
        semilogy(Fv, abs(squeeze(FRF)), 'LineWidth', 1.5);
        hold on
    end
end
xlim([3 40])
hold off
legend
%%
for k=1:10
    for i=1:3
        FRF=Y_all(i,k,Iv)./X_all(i,k,Iv);
        FRF_all(i,k,:)=FRF;
        figure(7)
        %semilogy(Fv, abs(squeeze(FRF)), 'LineWidth', 1.5);
        hold on
    end
end
xlim([3 35])
hold off
legend

figure(8)

semilogy(Fv, abs(squeeze(FRF_all(1:3,1,:))),Fv,abs(squeeze(H1_single_sided(:,1))), 'LineWidth', 1.5);

xlim([3 35])
title('Comparing FRFs to Avg TF (H_1)')
legend('FRF1','FRF2','FRF3','H1')
xlabel('Frequency(Hz)')
ylabel('Magnitude((m/s)/(m/s^2))')
grid on


%%
%Smoothing and resampling
for k=1:num_levels
    % H1=H1_single_sided(2049:28673,k);
    % N = length(H1);
    % 
    % 
    % % 1. Create a linear trend between endpoints
    % t = (0:N-1).';
    % trend = H1(1) + (H1(end) - H1(1)) * (t / (N-1));
    % 
    % % 2. Remove trend (forces endpoints to 0)
    % H1_detrended = H1 - trend;
    % H1_resampled_detrended=resample(H1_detrended,1,7);
    % N_new = length(H1_resampled_detrended);
    % t_new = (0:N_new-1).';
    % trend_new = H1(1) + (H1(end) - H1(1)) * (t_new / (N_new-1));
    % 
    % H1_resampled = H1_resampled_detrended + trend_new;
    H1_resampled=resample(H1_single_sided(2049:28673,k),1,15);
    H2_resampled=resample(H2_single_sided(2049:28673,k),1,15);
%3585:66561
    H1_final=smoothdata(H1_resampled,"gaussian",5);
    H2_final=smoothdata(H2_resampled,"gaussian",5);

    H1_final(1631:end)=smoothdata(H1_final(1631:end),"gaussian",20);
    H1_final_f(:,k)=H1_final;

    H2_final(1631:end)=smoothdata(H2_final(1631:end),"gaussian",20);
    H2_final_f(:,k)=H2_final;

    Fv_final=resample(Fv(2049:28673),1,15);
    figure(9)
    
    plot_label = ['Load: ', num2str(levels(k)), ' g'];
    plot(Fv_final, abs(H1_final_f(:,k)), 'LineWidth', 1.5, 'DisplayName', plot_label);
    hold on
    title('Averaged Frequency Response Function (H_1)');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude ((m/s)/(m/s^2))');
    grid on;
    xlim([3, 30]);
    
    % Set y-axis to logarithmic for clear modal visualization
    set(gca, 'YScale', 'log'); 
    legend('show', 'Location', 'best');
end
hold off

%%
for k=1:num_levels
    FRF_resampled=resample(FRF_all(3,k,2049:28673),1,15);
    FRF_final=smoothdata(FRF_resampled,"gaussian",5);
    FRF_final(2804:end)=smoothdata(FRF_final(2804:end),"gaussian",50);
    FRF_final_f(:,k)=FRF_final;
    Fv_final=resample(Fv(2049:28673),1,15);
    figure(10)
    
    plot_label = ['Load: ', num2str(levels(k)), ' g'];
    plot(Fv_final, abs(FRF_final_f(:,k)), 'LineWidth', 1.5, 'DisplayName', plot_label);
    hold on
    title('Frequency Response Function (FRF)');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude ((m/s)/(m/s^2))');
    grid on;
    xlim([3, 30]);
    
    % Set y-axis to logarithmic for clear modal visualization
    set(gca, 'YScale', 'log'); 
    legend('show', 'Location', 'best');
end
hold off
%%
figure(11)
plot(Fv, abs(H1_single_sided(:,1)), 'LineWidth', 1.5);
hold on
plot(Fv_final, abs(H1_final_f(:,1)), 'LineWidth', 1.5); 
title('Averaged Frequency Response Function (H_1)');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude ((m/s)/(m/s^2))');
    grid on;
    xlim([3, 30]);
    
    % Set y-axis to logarithmic for clear modal visualization
    set(gca, 'YScale', 'log'); 
    legend('show', 'Location', 'best');
hold off
%%
for k=1:10
    rms_accel_1(k)=rms(abs(X_all(1,k,2459:24577)));
    rms_accel_2(k)=rms(abs(X_all(2,k,2459:24577)));
    rms_accel_3(k)=rms(abs(X_all(3,k,2459:24577)));
    rms_accel(k)=(1/3)*(rms_accel_1(k)+rms_accel_2(k)+rms_accel_3(k));
    
    rms_vel_1(k)=rms(abs(Y_all(1,k,2459:24577)));
    rms_vel_2(k)=rms(abs(Y_all(2,k,2459:24577)));
    rms_vel_3(k)=rms(abs(Y_all(3,k,2459:24577)));

    rms_vel(k)=(1/3)*(rms_vel_1(k)+rms_vel_2(k)+rms_vel_3(k));

    max_vel_1(k)=max(abs(Y_all(1,k,2459:24577)));
    max_vel_2(k)=max(abs(Y_all(2,k,2459:24577)));
    max_vel_3(k)=max(abs(Y_all(3,k,2459:24577)));

    max_vel(k)=(1/3)*(max_vel_1(k)+max_vel_2(k)+max_vel_3(k));
    Energy_vel_1(k)=sum(abs(Y_all(1,k,2459:24577).^2));
    Energy_vel_2(k)=sum(abs(Y_all(2,k,2459:24577).^2));
    Energy_vel_3(k)=sum(abs(Y_all(3,k,2459:24577).^2));
    Energy_vel(k)=(1/3)*(Energy_vel_1(k)+Energy_vel_2(k)+Energy_vel_3(k));


end

%%
%save("Shaker_Table_TFs_Final_2.5_40Hz_New_Tests.mat",'H1_final_f','Fv_final','rms_accel','rms_vel','max_vel','Energy_vel')
