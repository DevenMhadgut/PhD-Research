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
%Load models parameterized on force and velocity for v_F
%Load deployment velocity...perform ifft to get time domain, crop the time
%domain velocity to start from max time velocity, then take the fft to get
%velocity in the frequency domain again
%Perform this for both models: v/H1 to get F and then F/H2 to get voltage in the
%frequency domain

%%
model_as_accel_va=load('InvLoadEstimation_Test_Results\State Matrices\Shaker Table Tests\Matrices_12.mat');
model_rms_accel_va=load('InvLoadEstimation_Test_Results\State Matrices\Shaker Table Tests\RMS_Accel_Param_Matrices_12.mat');
model_max_vel_va=load('InvLoadEstimation_Test_Results\State Matrices\Shaker Table Tests\Max_Vel_Param_Matrices_12.mat');
%model_rms_accel_less_smoothing_va=load('InvLoadEstimation_Test_Results\State Matrices\Shaker Table Tests\RMS_Accel_Param_less_smoothing_Matrices_12.mat');
model_energy_vel_less_smoothing_va=load('InvLoadEstimation_Test_Results\State Matrices\Shaker Table Tests\Energy_Vel_Param_less_smoothing_Matrices_12.mat');

%model_vel_vf=load('InvLoadEstimation_Test_Results\State Matrices\Quadruple Corrected 2pi drop samples Freq RMS and TF 3_70 Hz new mat19 velpar\Matrices_18  19.mat');

%model_force_vf_R1R2=load('InvLoadEstimation_Test_Results\State Matrices\Quadruple Corrected 2pi resample Freq RMS 3_70 Hz TF 0_100 R1R2 new mat19\Matrices_19.mat');
%model_vel_vf_R1R2=load('InvLoadEstimation_Test_Results\State Matrices\Quadruple Corrected 2pi drop samples Freq RMS and TF 3_70 Hz R1R2 new mat19 velpar\Matrices_19.mat');
%TF_Vel_to_Accel=load('Exp_TFs.mat','TF_PC_ampcorr');
%TF_Force_to_voltage=load('Exp_TFs.mat','TF_PC_ampcorrR1R2' );
load("Shaker_Table_TFs_Final.mat")
Energy_vel=[0.000703599571766886	0.000888403647098819	0.00106840439921908	0.00130471860340741	0.00142318764571976	0.00159080116628161	0.00174015379203356	0.00179962654855251	0.00181058172734362	0.00200245297394957	0.00210059222249584	0.00224329416778898];
%%
%Deployment velocities (frequency domain)
[freqp,Vel_dep_1]=GetPointData('Shaker Table Tests/Deployment Velocity Data/deployment_test_trigger_full_1.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
[freqp,Vel_dep_2]=GetPointData('Shaker Table Tests/Deployment Velocity Data/deployment_test_trigger_full_2.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
[freqp,Vel_dep_3]=GetPointData('Shaker Table Tests/Deployment Velocity Data/deployment_test_trigger_full_3.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
[freqp,Vel_dep_4]=GetPointData('Shaker Table Tests/Deployment Velocity Data/deployment_test_trigger_full_4.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
[freqp,Vel_dep_5]=GetPointData('Shaker Table Tests/Deployment Velocity Data/deployment_test_trigger_full_5.svd','FFT','Vib','Velocity','Real & Imag.',0,0);

%Deployment velocities (time domain - 320 Hz)
vel_dep_1_320Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep1_time.txt',Range="B6:B32773");
vel_dep_2_320Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep2_time.txt',Range="B6:B32773");
vel_dep_3_320Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep3_time.txt',Range="B6:B32773");
vel_dep_4_320Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep4_time.txt',Range="B6:B32773");
%vel_dep_5_320Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep5_time.txt',Range="B6:B32773");

%Deployment velocities (time domain - 256 Hz)
vel_dep_1_256Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep1_time_resampled.txt',Range="B6:B26197");
vel_dep_2_256Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep2_time_resampled.txt',Range="B6:B26197");
vel_dep_3_256Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep3_time_resampled.txt',Range="B6:B26197");
vel_dep_4_256Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep4_time_resampled.txt',Range="B6:B26197");
%vel_dep_5_256Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep5_time_resampled.txt',Range="B6:B26197");
%%
vel_dep_256Hz=[vel_dep_1_256Hz,vel_dep_2_256Hz,vel_dep_3_256Hz,vel_dep_4_256Hz];
vel_dep_320Hz=[vel_dep_1_320Hz,vel_dep_2_320Hz,vel_dep_3_320Hz,vel_dep_4_320Hz];

time=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep1_time_resampled.txt',Range="A6:A26197");

time_val=readmatrix('Shaker Table Tests/Validation test velocities/dep_vel_rep_1.txt',Range="A6:A26197");
val_vel=readmatrix('Shaker Table Tests/Validation test velocities/dep_vel_rep_1.txt',Range="B6:B410956");

%time_320Hz=readmatrix('Shaker Table Tests/Deployment Velocity Data/dep1_time_resampled.txt',Range="A6:A26197");;
figure(1)
for k=1:4
    plot(time,vel_dep_256Hz(:,k))%,time,vel_dep_320Hz(:,k));
    hold on
    title('Velocity Signal');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    grid on;
end
hold off
xlim([0 20])
legend
%%
start_times = [7.8, 5.0, 8.0, 8.4];

% Loop through each file to process and trim the data
for k = 1:size(vel_dep_256Hz,2)
 
    % Find the index where the time is closest to the target start time
    [~, start_idx] = min(abs(time - start_times(k)));
    
    if start_idx > 1
        vel_dep_256Hz(1:start_idx-1,k) = 0;
        
    end
    %time(1:start_idx-1) = 0;
    %vel_dep_256Hz_extended(:,k)=[vel_dep_256Hz(:,k);zeros(262144-length(vel_dep_256Hz(:,k)),1)];
    figure(2)
    plot(time, vel_dep_256Hz(:,k));
    title('Trimmed Velocity Signal');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    grid on;
    hold on
    
end
hold off
xlim([0 20])
legend
%%

%Deployment Verification 

% [freqp,Vel_verify_interp_unscaled]=GetPointData('Dep_Verify_new_0_100Hz/Unscaled_no_correction_3_70_drop_samples.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Force_verify_interp_unscaled]=GetPointData('Dep_V erify_new_0_100Hz/Unscaled_no_correction_3_70_drop_samples.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,Volt_verify_interp_unscaled]=GetPointData('Dep_Verify_new_0_100Hz/Unscaled_no_correction_3_70_drop_samples.svd','FFT','Ref2','Force','Real & Imag.',0,0);





%%
% Vel_dep=[Vel_dep_1;Vel_dep_2;Vel_dep_3;Vel_dep_4;Vel_dep_5];
% figure(1)
% for k=1:size(Vel_dep,1)
%     %Vel_dep(k,:)=smoothdata(abs(Vel_dep(k,:)),'gaussian',200);
%     plot(freqp,abs(Vel_dep(k,:)))
%     hold on
% end
% xlabel('Frequency (Hz)')
% ylabel('Amplitude (m/s)')
% title('Deployment Velocity for 5 deployment tests (Frequency Domain)')
% grid on
% xlim([0 100])
% legend
% hold off
%%
% t_trim=zeros(1,32768);
% T=128/32768;
% t = (0:32768-1)*T;
% 
% figure(2)
% for k=1%:size(Vel_dep,1)
%     %ForcePC_ampcorr(k,:) = transpose(ForcePC_ampcorr(k,:));
%     velsnew(k,:)=[0,Vel_dep(k,:),zeros(1,128*28-1)];
%     velst(k,:) = [real(velsnew(k,1)), velsnew(k,2:end), ...
%                      imag(velsnew(k,1)), conj(fliplr(velsnew(k,2:end)))];
%     vels_real(k,:)=ifft(velst(k,:),2*length(velsnew));
%     [~,max_idx(k,:)]=max(vels_real(k,:));
%     vels_real(k,1:(max_idx(k,:))-100)=0; 
%     vels_real(k,:)=vels_real(k,:)*length(velsnew);
%     plot(t,vels_real(k,:))
%    hold on
% end
% 
% xlabel('Time(s)')
% ylabel('Velocity(m/s)')
% %legend('Deployment Velocity','Reference (Periodic Chirp)')
% %title('Deployment Velocity for 5 deployments')
% %legend
% 
% grid on
% xlim([0 30])
% ylim([-0.5 0.5])
% xline(1.8320,'--r','LineWidth',3)
% hold off

for k=1:size(vel_dep_256Hz,2)
    
    tstart=1;
    Ts = mean(diff(time(tstart:end)));                             % Sampling Interval
    Fs = 1/Ts;                                                  % Sampling Frequency
    Fn = Fs/2;                                                  % Nyquist Frequency
    L = numel(time(tstart:end));                                   % Signal Length

    s=vel_dep_256Hz(:,k);
    sm = s - mean(s);                                       % Mean-Corrected Signal (Eliminates 0 Hz Offset)
    FTs(:,k) = fft(sm)/L;                                        % Fourier Transform
    Fv = linspace(0, 1, fix(L/2)+1)*Fn;                     % Frequency Vector
    Iv = 1:numel(Fv);                                       % Index Vector
    
    figure(3)
    semilogy(Fv, abs(FTs(Iv,k))*2)%,freqp,abs(Vel_dep_1));
    xlabel('Frequency (Hz)')
    ylabel('Amplitude (m/s)')
    title('Trimmed Velocity for deployment tests (Frequency Domain)')
    grid on
    xlim([3 70])
    legend
    hold on
end
hold off

%%
% v/H1 to get F and then F/H2 to get voltage in the frequency domain
r=8; %Decimation Parameter

% Force parameterized model
load_levels=[0.24,0.27,0.3,0.33,0.36,0.38,0.4,0.41,0.42,0.43,0.45,0.48,0];

%num=load_levels;
%num=Energy_vel;
num=[rms_accel,0.003392];
%num=max_vel;
%freqpnew=resample(freqp(384:8960),1,8);
%freqpnew=resample(freqp,1,8);
%freqpnew=freqp(384:r:8960);

%freqpnew=freqp(1:r:end);

% st_freq=5; %Start Frequency Index
% endfreq=3605; %End Frequency Index
x=Fv(308:7163)*2*pi*1i;
%x=Fv(308:7163);

%x= Fv_final(st_freq:endfreq)*2*pi*1i;
x = [x, conj(x)];
%k=1;

%%
% %Resample Velocity FFT
% figure(4)
% for k=1:4
%    [p, q] = rat(3601 / 6856);
% 
%     v_fft_resampled=resample(FTs(308:7163,k),p,q);
%     v_fft_resampled_final(:,k)=v_fft_resampled(1:end-1);
%     %v_fft_resampled_final(:,k)=[v_fft_resampled;v_fft_resampled(end)];
%     Fv_resampled=resample(Fv(308:7163),p,q);
%     %Fv_resampled=[Fv_resampled,70];
% 
%     semilogy(Fv_resampled(1:end-1),abs(v_fft_resampled_final(:,k)));
%     hold on
% 
% end
% hold off
% xlim([3 70])
%%Compare IFFT of full and reduced frequency velocity

for k=3
    velnew=[zeros(307,1);FTs(308:7163,k);zeros(13097-7163,1)];
    velnewt= [real(velnew(1)); velnew(2:end); ...
                     imag(velnew(1)); conj(flipud(velnew(2:end)))];
    velnew_real=ifft(velnewt,2*length(velnew));
    
    T_dep=128/32768;
    
    t1_dep_vel=(0:length(velnew_real)-1)/Fs;
    vel_realact_dep_velparam(:,k)=velnew_real*length(velnew);
    figure (4)
    plot(t1_dep_vel,vel_realact_dep_velparam(:,k))
     xlabel('Time (s)')
    ylabel('Amplitude (m/s)')
    title('Velocity content in 3-70 Hz range (Time Domain)')
    hold on%,time,vel_dep_256Hz(:,4))
    grid on
end
hold off
legend
%%
figure(5)
for params=1:13
    %H_pred_dep=model_as_accel_va.bf.eval({x,num(params)});
    %H_pred_dep=model_energy_vel_less_smoothing_va.bf.eval({x,num(params)});
    %H_pred_dep=model_energy_vel_less_smoothing_va.bf.eval({x,6.29e-4});

    H_pred_dep=model_rms_accel_va.bf.eval({x,num(params)});
    %H_pred_dep=model_max_vel_va.bf.eval({x,num(params)});
    max_H_pred_dep(params)=max(abs(H_pred_dep(1:length(H_pred_dep)/2)));
    % F_force_param(k,:) = resample(FTs(Iv(384:8960)),1,r)./(transpose(H_pred_dep(1:length(H_pred_dep)/2)));
    % F_force_param(k,:) = resample(FTs(Iv(1:12800)),1,r)./(transpose(H_pred_dep(1:length(H_pred_dep)/2)));
    A_accel_param(:,params) = FTs(308:7163,3)./H_pred_dep(1:length(H_pred_dep)/2);
    plot_label = ['Load: ', num2str(load_levels(params)), ' g'];
    semilogy(Fv(308:7163),abs(A_accel_param(:,params)), 'DisplayName', plot_label)
    
    %plot(freqpnew,abs(F_force_param(1,:)),'-o',freqpnew,abs(voltage_force_param_R1R2(1,:)),'-x')
    k=k+1;
    hold on
    legend('show', 'Location', 'best');

end
%plot(freqp,abs(ForcePC_amp1_0_ampcorr),'-*');

xlabel('Frequency (Hz)')
ylabel('Amplitude (m/s^2)')
%legend('Force','Voltage')
title('Acceleration to be applied: Input Parameterized Model')
grid on
hold off
xlim([3 70])
%legend
%legend('force','voltage')
%%
%Accelnew=A_accel_param(:,1);
%for k=1:12
for k=[1,13]
Accelnew=[zeros(307,1);A_accel_param(:,k);zeros(13097-7163,1)];
Accelnewt= [real(Accelnew(1)); Accelnew(2:end); ...
                 imag(Accelnew(1)); conj(flipud(Accelnew(2:end)))];
Accelnew_real(:,k)=ifft(Accelnewt,2*length(Accelnew));

T_dep=128/32768;

t1_dep=(0:length(Accelnew_real(:,k))-1)/Fs;
Accel_realact_dep_Accelparam(:,k)=Accelnew_real(:,k)*length(Accelnew);

%Accel_realact_dep_Accelparam_toapply=transpose([Accel_realact_dep_Accelparam,zeros(1,32768-length(Accel_realact_dep_Accelparam))]);
timeaccelvector=[t1_dep' Accel_realact_dep_Accelparam(:,k)];
timeaccelvector_all(:,:,k)=timeaccelvector;
%%
figure(6)
plot(t1_dep,Accel_realact_dep_Accelparam(:,k))
xlabel('Time (s)')
ylabel('Amplitude (m/s^2)')
title('Acceleration to be applied in the time domain: Input Parameterized Model')
grid on
hold on
end
hold off
%legend
%xlim([0 20])
% vec1=timeaccelvector_all(1:13097,:,3);
% vec2=timeaccelvector_all(1:13097,:,10);
%%
% for params=5
%    % H_pred_dep=model_energy_vel_less_smoothing_va.bf.eval({x,num(params)});
%         H_pred_dep=model_energy_vel_va.bf.eval({x,num(params)});
% 
%     x2= Fv_final(5:3605)*2*pi*1i;
%     x2=[x2,conj(x2)];
%     H_pred=model_energy_vel_less_smoothing_va.bf.eval({x2,num(params)});
% 
%     figure(7)
%     semilogy(Fv(308:7163),abs(H_pred_dep(1:length(H_pred_dep)/2)))
%     hold on
%     semilogy(abs(x2(1:length(H_pred)/2))./(2*pi),abs(transpose(H_pred(1:length(H_pred)/2))))
% 
% end

figure(8)
dt=1/256;
[M1,I1]=max(vel_realact_dep_velparam(:,3));
[M2,I2]=max(val_vel((1460/dt):(1460/dt+26191),1));

st_time_add=I1-I2;
plot(t1_dep_vel,vel_realact_dep_velparam(:,3),time_val,val_vel((1460/dt+4875):(1460/dt+26191+4875),1))
grid on
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Velocity Comparison')
%xlim([5 20])
legend('Deployment Velocity','Validation Test','Abs Error')
%%
EL2p(k,:) = (sqrt((sum((abs(vel_realact_dep_velparam(1:26192,3)-val_vel((1460/dt+4875):(1460/dt+26191+4875),1))).^2))/(sum(abs(val_vel((1460/dt+4875):(1460/dt+26191+4875),1)).^2))))/length(time_val);
%%
target=readmatrix('Shaker Table Tests\Validation test inputs\target_full.txt',Range="B4:B32771");
control=readmatrix('Shaker Table Tests\Validation test inputs\control_full.txt',Range="B4:B32771");
time_input=readmatrix('Shaker Table Tests\Validation test inputs\control_full.txt',Range="A4:A32771");

figure(9)
plot(time_input,target,time_input,control)
legend("Target","Control")
xlabel('Time (s)')
ylabel('Acceleration (g)')
title('Input Accel Comparison')
%xlim([5 20])
EL2p_input(k,:) = (sqrt((sum((abs(target-control)).^2))/(sum(abs(control).^2))))/length(time_val);
%%
%Freq domain comparison
%for k=1:size(target)
    
    tstart=1;
    Ts = mean(diff(time_input(tstart:end)*0.001));                             % Sampling Interval
    Fs = 1/Ts;                                                  % Sampling Frequency
    Fn = Fs/2;                                                  % Nyquist Frequency
    L = numel(time_input(tstart:end)*0.001);                                   % Signal Length

    s_t=target;
    s_c=control;
    sm_t = s_t - mean(s_t);       % Mean-Corrected Signal (Eliminates 0 Hz Offset)
    sm_c = s_c - mean(s_c);                                       % Mean-Corrected Signal (Eliminates 0 Hz Offset)

    FTs_t = fft(sm_t)/L;                                        % Fourier Transform
        FTs_c = fft(sm_c)/L;                                        % Fourier Transform

    Fv = linspace(0, 1, fix(L/2)+1)*Fn;                     % Frequency Vector
    Iv = 1:numel(Fv);                                       % Index Vector
    
    figure(10)
    semilogy(Fv,abs(FTs_c(Iv))*2,Fv, abs(FTs_t(Iv))*2);
    xlabel('Frequency (Hz)')
    ylabel('Amplitude (m/s^2)')
    title('Trimmed Velocity for deployment tests (Frequency Domain)')
    grid on
    xlim([3 70])
    legend("control","target")
    %hold on
%end
%hold off
figure(11)

tstart=1;
    Ts_dep = mean(diff(t1_dep_vel(1:26192)));                             % Sampling Interval
    Fs_dep = 1/Ts_dep;                                                  % Sampling Frequency
    Fn_dep = Fs_dep/2;                                                  % Nyquist Frequency
    L_dep = numel(t1_dep_vel(1:26192));                                   % Signal Length

    Ts_val = mean(diff(time_val(tstart:end)));                             % Sampling Interval
    Fs_val = 1/Ts_val;                                                  % Sampling Frequency
    Fn_val = Fs_val/2;                                                  % Nyquist Frequency
    L_val = numel(time_val(tstart:end));                                   % Signal Length


    s_dep=vel_realact_dep_velparam(1:26192,3);
    s_val=val_vel((1460/dt+4875):(1460/dt+26191+4875),1);
    sm_dep = s_dep - mean(s_dep);       % Mean-Corrected Signal (Eliminates 0 Hz Offset)
    sm_val = s_val - mean(s_val);                                       % Mean-Corrected Signal (Eliminates 0 Hz Offset)

    FTs_dep = fft(sm_dep)/L;                                        % Fourier Transform
        FTs_val = fft(sm_val)/L;                                        % Fourier Transform

    Fv_dep = linspace(0, 1, fix(L_dep/2)+1)*Fn_dep;                     % Frequency Vector
    Iv_dep = 1:numel(Fv_dep);                                       % Index Vector

    Fv_val = linspace(0, 1, fix(L_val/2)+1)*Fn_val;                     % Frequency Vector
    Iv_val = 1:numel(Fv_val);  
    semilogy(Fv_val,abs(FTs_val(Iv_val))*2,Fv_dep, abs(FTs_dep(Iv_dep))*2);
    xlabel('Frequency (Hz)')
    ylabel('Amplitude (m/s^2)')
    title('Trimmed Velocity for deployment tests (Frequency Domain)')
    grid on
    xlim([3 70])
    legend("validation","deployment")

    EL2p_input_freq = (sqrt((sum((abs(abs(FTs_t(Iv))*2-abs(FTs_c(Iv))*2)).^2))/(sum(abs(FTs_c(Iv))*2))))/length(Iv);
    EL2p_output_freq = (sqrt((sum((abs(abs(FTs_dep(Iv_dep))*2-abs(FTs_val(Iv_val))*2)).^2))/(sum(abs(FTs_val(Iv_val))*2))))/length(Iv_val);
% rmse_input_freq=rmse(abs(FTs_t(Iv))*2,abs(FTs_c(Iv))*2);
% rmse_output_freq=rmse(abs(FTs_dep(Iv_val))*2,abs(FTs_val(Iv_val))*2);
%%
figure(12)
AbsErrorVel=abs(vel_realact_dep_velparam(1:26192,3)-val_vel((1460/dt+4875):(1460/dt+26191+4875),1));
semilogy(t1_dep_vel(1:26192),(AbsErrorVel./vel_realact_dep_velparam(1:26192,3))*100)
 xlabel('Time (s)')
    ylabel('Amplitude (m/s)')
    title('Velocity Error(Time Domain)')
    grid on
    xlim([5 20])
    %legend("validation","deployment")
%%
    figure(13)
plot(Fv_val,(abs(FTs_val(Iv_val))*2- abs(FTs_dep(Iv_dep))*2))
 xlabel('Time (s)')
    ylabel('Amplitude (m/s)')
    title('Velocity Error(Frequency Domain)')
    grid on
    xlim([3 70])
