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
    'defaultlinelinewidth',2.0,'defaultpatchlinewidth',1.0,...
    'defaulttextfontsize',18,'DefaultLineMarkerSize',14);

set(groot, 'defaultLegendInterpreter', 'remove');

%%

%Replace these with new boom-tip velocity signals from the shaker test

% [freqp,Vel_PC_amp0_05_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_1_0.05V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_06_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_2_0.06V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_07_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_3_0.07V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_08_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_4_0.08V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_09_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_5_0.09V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_1_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_6_0.1V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_2_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_1_0.2V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_3_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_2_0.3V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_4_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_3_0.4V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_5_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_4_0.5V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_6_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_5_0.6V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_7_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_1_0.7V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_8_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_2_0.8V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp0_9_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_3_0.9V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
% [freqp,Vel_PC_amp1_0_ampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_4_1.0V.svd','FFT','Vib','Velocity','Real & Imag.',0,0);

%vel_PC=[Vel_PC_amp0_05_ampcorr; Vel_PC_amp0_06_ampcorr;Vel_PC_amp0_07_ampcorr;Vel_PC_amp0_08_ampcorr;Vel_PC_amp0_09_ampcorr;Vel_PC_amp0_1_ampcorr;Vel_PC_amp0_2_ampcorr;Vel_PC_amp0_3_ampcorr;Vel_PC_amp0_4_ampcorr;Vel_PC_amp0_5_ampcorr;Vel_PC_amp0_6_ampcorr;Vel_PC_amp0_7_ampcorr;Vel_PC_amp0_8_ampcorr;Vel_PC_amp0_9_ampcorr;Vel_PC_amp1_0_ampcorr];
%%
%Load TFs
load("Shaker_Table_TFs_Final_2.5_40Hz_New_Tests.mat")


%%
%Define Parameter and create vector of parameters
%load_levels=[0.,0.27,0.3,0.33,0.36,0.38,0.4,0.41,0.42,0.43,0.45,0.48];
load_levels=[0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.38];

%%
%pAAA Fitting

%Modify this section for the shaker test

N_iter=20;
%num=rms_force;
%num=load_levels;
%num=max_vel;
num=rms_accel(1:8);
%num=Energy_vel;
H1_final_f=transpose(H1_final_f);
for m=1
    for n=8
        for k=1:length(N_iter)
        exc=m;
        st_freq=29; %Start Frequency Index
        endfreq=1722; %End Frequency Index
       % endfreq=1503; %End Frequency Index

        num_samp=n;
        x= Fv_final(st_freq:endfreq)*2*pi*1i;% -freqp(200:end)*1i];
        y = num(1:num_samp);
        %%
        
        samples = H1_final_f(1:num_samp,st_freq:endfreq);
        
        x = [x, conj(x)];
        samples = transpose([samples, conj(samples)]);
        sampling_values = {x,y}; 
        
        
        %%
        % Approximate data via p-AAA with error tolerance 1e-5
        options.max_iter=100;
        options.real_loewner=1;
        %options.max_itpl=[30 15];
        [bf,info(m,n)] = paaa(samples,sampling_values,0.01,options);
        [min_value(m,n),min_index(m,n)]=min(info(m,n).rel_ls_errors);

        % if mod(min_index(m,n), 2) ~= 0
        %     % If odd, add 1 to complete the pair
        %     min_index(m,n) = min_index(m,n) + 1; 
        % end
        options.max_iter=min_index(m,n);
        %bf=paaa(samples,sampling_values,0.01,options);
        bf = paaa(samples,sampling_values,0.01,options);
       
        
        %%
        H_pred=bf.eval({x,num(exc)});
       % [A,B,C,E] = bf_realization(bf,num(1:num_samp));
        %%
        [Ar,Br,Cr,Er] = bf_real_realization(bf,num(1:num_samp));
         

       save(['InvLoadEstimation_Test_Results\State Matrices\Shaker Table Tests\New Tests Load Cases 1-8\RMS_Accel_Param_less_smoothing_Matrices_all_3_35Hz_1_to_8_LoadCases 3 ',num2str(n),'.mat'],"Ar","Br","Cr","Er","H_pred","min_value","min_index","bf")

        %%
        % 
        figure(5)
        semilogy(abs(x(1:length(H_pred)/2))./(2*pi),abs(transpose(H1_final_f(exc,st_freq:endfreq))),abs(x(1:length(H_pred)/2))./(2*pi),abs(transpose(H_pred(1:length(H_pred)/2))),LineWidth=3)
        legend ("Actual","Estimated")
        %xlim([0 50])
        xlabel("Frequency (Hz)")
        ylabel("Amplitude ((m/s)/N)")
        title("Transfer Function (Velocity/Force)")
        ax=gca;
        ax.FontSize=20;
        grid on
        %saveas(gcf,['Input_Estimation Plots/Order = ', num2str(N_iter(k)),'.png']);
       saveas(gcf,['Input_Estimation Plots/Shaker Table Tests/New Tests Load Cases 1-8/RMS_Accel_less_smoothing_Parameter_all_3_35Hz_1_to_8_LoadCases(Excluded,Total) 3 = ', num2str([m n]),'.fig']);
       saveas(gcf,['Input_Estimation Plots/Shaker Table Tests/New Tests Load Cases 1-8/RMS_Accel_less_smoothing_Parameter_all_3_35Hz_1_to_8_LoadCases(Excluded,Total) 3 = ', num2str([m n]),'.png']);

        %%
        Ns=length(x);
        %EL2AAA(k)  = (1/Ns)*sqrt((sum((abs(ypss26(st_freq:endfreq,exc)-(H_pred))).^2))/(sum((abs(ypss26(st_freq:endfreq,exc))).^2)));
        end
    end 
end 
%%

for m=2:8
        x= Fv_final(st_freq:endfreq)*2*pi*1i;% -freqp(200:end)*1i];
        x = [x, conj(x)];

        H_pred=bf.eval({x,num(m)});

        figure(6)
        semilogy(abs(x(1:length(H_pred)/2))./(2*pi),abs(transpose(H1_final_f(m,st_freq:endfreq))),abs(x(1:length(H_pred)/2))./(2*pi),abs(transpose(H_pred(1:length(H_pred)/2))),LineWidth=3)
        legend ("Actual","Estimated")
        %xlim([0 50])
        xlabel("Frequency (Hz)")
        ylabel("Amplitude ((m/s)/N)")
        title("Transfer Function (Velocity/Force)")
        ax=gca;
        ax.FontSize=20;
        grid on
        %saveas(gcf,['Input_Estimation Plots/Order = ', num2str(N_iter(k)),'.png']);
       saveas(gcf,['Input_Estimation Plots/Shaker Table Tests/New Tests Load Cases 1-8/RMS_Accel_less_smoothing_Parameter_all_3_35Hz_1_to_8_LoadCases(Excluded,Total) 3 = ', num2str([m n]),'.fig']);
       saveas(gcf,['Input_Estimation Plots/Shaker Table Tests/New Tests Load Cases 1-8/RMS_Accel_less_smoothing_Parameter_all_3_35Hz_1_to_8_LoadCases(Excluded,Total) 3 = ', num2str([m n]),'.png']);

end


