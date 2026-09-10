clc; clear; close all;
addpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Geometry Sensitivity Paper'))
addpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\barycentric_forms'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\lr_paaa'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\paaa'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\sv_paaa'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\utils'))
rmpath(genpath('C:\Users\devenmhadgut\OneDrive - Virginia Tech\Desktop\Laser_VF\Laser_VF\paaa-LB'))


%%

%[freqp,ForcePC_amp0_05_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_1_0.05V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_06_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Single/scan_2_0.06V.svd','FFT','Ref1','Force','Real & Imag.',3,0);
% [freqp,ForcePC_amp0_07_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Single/scan_3_0.07V.svd','FFT','Ref1','Force','Real & Imag.',3,0);
% [freqp,ForcePC_amp0_08_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_1_0.08V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_09_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_2_0.09V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_1_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_3_0.1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_2_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_4_0.2V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_3_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_5_0.3V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_4_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_6_0.4V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_5_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_7_0.5V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_6_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_8_0.6V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_7_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_9_0.7V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_8_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_10_0.8V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_9_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_11_0.9V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp1_0_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_12_1.0V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_85_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/0.85_0.95_1.05_1.1/scan_1_0.85V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_95_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/0.85_0.95_1.05_1.1/scan_2_0.95V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_05_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/0.85_0.95_1.05_1.1/scan_3_1.05V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_1_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/0.85_0.95_1.05_1.1/scan_4_1.1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);


% [freqp,ForcePC_amp0_05_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_1_0.05V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_06_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_2_0.06V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_07_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_3_0.07V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_08_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_1_0.08V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_09_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_2_0.09V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_1_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_3_0.1V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_2_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_4_0.2V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_3_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_5_0.3V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_4_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_6_0.4V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_5_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_7_0.5V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_6_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_8_0.6V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_7_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_9_0.7V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_8_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_10_0.8V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_9_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_11_0.9V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp1_0_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/scan_12_1.0V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_85_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/0.85_0.95_1.05_1.1/scan_1_0.85V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_95_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/0.85_0.95_1.05_1.1/scan_2_0.95V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_05_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/0.85_0.95_1.05_1.1/scan_3_1.05V.svd','FFT','Ref2','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_1_noampcorrR2]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Single Corrected/0.85_0.95_1.05_1.1/scan_4_1.1V.svd','FFT','Ref2','Force','Real & Imag.',0,0);

%%
%[freqp,ForcePC_amp0_05_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_1_0.05V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_06_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_2_0.06V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_07_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_3_0.07V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_08_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_1_0.08V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_09_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_2_0.09V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_1_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_3_0.1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_2_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_4_0.2V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_3_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_5_0.3V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_4_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_6_0.4V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_5_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_7_0.5V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_6_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_8_0.6V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_7_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_9_0.7V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_8_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_10_0.8V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_9_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_11_0.9V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp1_0_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/scan_12_1.0V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_85_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/0.85_0.95_1.05_1.1/scan_1_0.85V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_95_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/0.85_0.95_1.05_1.1/scan_2_0.95V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_05_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/0.85_0.95_1.05_1.1/scan_3_1.05V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_1_doublecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Double Corrected/0.85_0.95_1.05_1.1/scan_4_1.1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);

%%
% [freqp,ForcePC_amp0_05_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_1_0.05V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_06_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_2_0.06V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_07_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_3_0.07V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_08_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_1_0.08V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_09_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_2_0.09V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_1_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_3_0.1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_2_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_4_0.2V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_3_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_5_0.3V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_4_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_6_0.4V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_5_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_7_0.5V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_6_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_8_0.6V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_7_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_9_0.7V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_8_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_10_0.8V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp0_9_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_11_0.9V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% [freqp,ForcePC_amp1_0_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/scan_12_1.0V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_85_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/0.85_0.95_1.05_1.1/scan_1_0.85V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_95_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/0.85_0.95_1.05_1.1/scan_2_0.95V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_05_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/0.85_0.95_1.05_1.1/scan_3_1.05V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_1_triplecorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Triple Corrected/0.85_0.95_1.05_1.1/scan_4_1.1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);

%%
% [freqp,ForcePC_amp0_05_quadcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple Partial/scan_1_0.05V.svd','FFT','Ref1','Force','Real & Imag.',3,0);
% [freqp,ForcePC_amp0_3_quadcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple Partial/scan_2_0.3V.svd','FFT','Ref1','Force','Real & Imag.',3,0);
% [freqp,ForcePC_amp0_05_uncorr]=GetPointData('InvLoadEstimation_Test_Results/Uncorrected/scan_1_0.05V.svd','FFT','Ref1','Force','Real & Imag.',3,0);
% [freqp,ForcePC_amp0_3_uncorr]=GetPointData('InvLoadEstimation_Test_Results/Uncorrected/scan_8_0.3V.svd','FFT','Ref1','Force','Real & Imag.',3,0);


%%
% [freqp,ForcePC_amp1_ampcorr_double]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corr/New Point Spool Fixed/Double_Smooth/ScanDoubleSmooth.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% 
% [freqp,ForcePC_amp1_ampcorr_triple]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corr/New Point Spool Fixed/Triple_Smooth/ScanTripleSmooth.svd','FFT','Ref1','Force','Real & Imag.',0,0);
% 
% [freqp,ForcePC_amp1_ampcorr_quad]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corr/New Point Spool Fixed/Quadruple_Smooth/ScanQuadrupleSmooth.svd','FFT','Ref1','Force','Real & Imag.',0,0);


%%
% Generate Amp Corr Files
%ForcePC_no_ampcorr = [ForcePC_amp0_05_noampcorr; ForcePC_amp0_06_noampcorr;ForcePC_amp0_07_noampcorr;ForcePC_amp0_08_noampcorr;ForcePC_amp0_09_noampcorr;ForcePC_amp0_1_noampcorr;ForcePC_amp0_2_noampcorr;ForcePC_amp0_3_noampcorr;ForcePC_amp0_4_noampcorr;ForcePC_amp0_5_noampcorr;ForcePC_amp0_6_noampcorr]%;ForcePC_amp0_7_noampcorr;ForcePC_amp0_8_noampcorr;ForcePC_amp0_9_noampcorr;ForcePC_amp1_0_noampcorr];
%ForcePC_no_ampcorr = [ForcePC_amp0_7_ampcorr;ForcePC_amp0_8_ampcorr;ForcePC_amp0_9_ampcorr;ForcePC_amp1_ampcorr];
%ForcePC_no_ampcorr = [ForcePC_amp1_ampcorr];

%ForcePC_no_ampcorr = [ForcePC_amp0_05_noampcorr]%; ForcePC_amp0_06_noampcorr;ForcePC_amp0_07_noampcorr;ForcePC_amp0_08_noampcorr;ForcePC_amp0_09_noampcorr;ForcePC_amp0_1_noampcorr;ForcePC_amp0_2_noampcorr;ForcePC_amp0_3_noampcorr;ForcePC_amp0_4_noampcorr;ForcePC_amp0_5_noampcorr;ForcePC_amp0_6_noampcorr;ForcePC_amp0_7_noampcorr;ForcePC_amp0_8_noampcorr;ForcePC_amp0_9_noampcorr;ForcePC_amp1_0_noampcorr];
% ForcePC_no_ampcorr = [ForcePC_amp0_08_noampcorr;ForcePC_amp0_09_noampcorr;ForcePC_amp0_1_noampcorr;ForcePC_amp0_2_noampcorr;ForcePC_amp0_3_noampcorr;ForcePC_amp0_4_noampcorr;ForcePC_amp0_5_noampcorr;ForcePC_amp0_6_noampcorr;ForcePC_amp0_7_noampcorr;ForcePC_amp0_8_noampcorr;ForcePC_amp0_9_noampcorr;ForcePC_amp1_0_noampcorr];
ForcePC_no_ampcorr = [ForcePC_amp0_85_noampcorr;ForcePC_amp0_95_noampcorr;ForcePC_amp1_05_noampcorr;ForcePC_amp1_1_noampcorr];

%ForcePC_no_ampcorrR2 = [ForcePC_amp0_05_noampcorrR2; ForcePC_amp0_06_noampcorrR2;ForcePC_amp0_07_noampcorrR2;ForcePC_amp0_08_noampcorrR2;ForcePC_amp0_09_noampcorrR2;ForcePC_amp0_1_noampcorrR2;ForcePC_amp0_2_noampcorrR2;ForcePC_amp0_3_noampcorrR2;ForcePC_amp0_4_noampcorrR2;ForcePC_amp0_5_noampcorrR2;ForcePC_amp0_6_noampcorrR2];
%ForcePC_no_ampcorrR2 = [ForcePC_amp0_7_ampcorrR2;ForcePC_amp0_8_ampcorrR2;ForcePC_amp0_9_ampcorrR2;ForcePC_amp1_ampcorrR2];
%ForcePC_no_ampcorrR2 = [ForcePC_amp1_ampcorrR2];
ForcePC_no_ampcorrR2 = [ForcePC_amp0_85_noampcorrR2;ForcePC_amp0_95_noampcorrR2;ForcePC_amp1_05_noampcorrR2;ForcePC_amp1_1_noampcorrR2];

%ForcePC_no_ampcorrR2 = [ForcePC_amp0_05_noampcorrR2]%; ForcePC_amp0_06_noampcorrR2;ForcePC_amp0_07_noampcorrR2;ForcePC_amp0_08_noampcorrR2;ForcePC_amp0_09_noampcorrR2;ForcePC_amp0_1_noampcorrR2;ForcePC_amp0_2_noampcorrR2;ForcePC_amp0_3_noampcorrR2;ForcePC_amp0_4_noampcorrR2;ForcePC_amp0_5_noampcorrR2;ForcePC_amp0_6_noampcorrR2;ForcePC_amp0_7_noampcorrR2;ForcePC_amp0_8_noampcorrR2;ForcePC_amp0_9_noampcorrR2;ForcePC_amp1_0_noampcorrR2];
% ForcePC_no_ampcorrR2 = [ForcePC_amp0_08_noampcorrR2;ForcePC_amp0_09_noampcorrR2;ForcePC_amp0_1_noampcorrR2;ForcePC_amp0_2_noampcorrR2;ForcePC_amp0_3_noampcorrR2;ForcePC_amp0_4_noampcorrR2;ForcePC_amp0_5_noampcorrR2;ForcePC_amp0_6_noampcorrR2;ForcePC_amp0_7_noampcorrR2;ForcePC_amp0_8_noampcorrR2;ForcePC_amp0_9_noampcorrR2;ForcePC_amp1_0_noampcorrR2];


%ForcePC_doublecorr = [ForcePC_amp0_05_doublecorr]%; ForcePC_amp0_06_doublecorr;ForcePC_amp0_07_doublecorr;ForcePC_amp0_08_doublecorr;ForcePC_amp0_09_doublecorr;ForcePC_amp0_1_doublecorr;ForcePC_amp0_2_doublecorr;ForcePC_amp0_3_doublecorr;ForcePC_amp0_4_doublecorr;ForcePC_amp0_5_doublecorr;ForcePC_amp0_6_doublecorr;ForcePC_amp0_7_doublecorr;ForcePC_amp0_8_doublecorr;ForcePC_amp0_9_doublecorr;ForcePC_amp1_0_doublecorr];
%ForcePC_doublecorr = [ForcePC_amp0_08_doublecorr;ForcePC_amp0_09_doublecorr;ForcePC_amp0_1_doublecorr;ForcePC_amp0_2_doublecorr;ForcePC_amp0_3_doublecorr;ForcePC_amp0_4_doublecorr;ForcePC_amp0_5_doublecorr;ForcePC_amp0_6_doublecorr;ForcePC_amp0_7_doublecorr;ForcePC_amp0_8_doublecorr;ForcePC_amp0_9_doublecorr;ForcePC_amp1_0_doublecorr];
ForcePC_doublecorr = [ForcePC_amp0_85_doublecorr;ForcePC_amp0_95_doublecorr;ForcePC_amp1_05_doublecorr;ForcePC_amp1_1_doublecorr];

%ForcePC_triplecorr = [ForcePC_amp0_05_triplecorr]%; ForcePC_amp0_06_triplecorr;ForcePC_amp0_07_triplecorr;ForcePC_amp0_08_triplecorr;ForcePC_amp0_09_triplecorr;ForcePC_amp0_1_triplecorr;ForcePC_amp0_2_triplecorr;ForcePC_amp0_3_triplecorr;ForcePC_amp0_4_triplecorr;ForcePC_amp0_5_triplecorr;ForcePC_amp0_6_triplecorr;ForcePC_amp0_7_triplecorr;ForcePC_amp0_8_triplecorr;ForcePC_amp0_9_triplecorr;ForcePC_amp1_0_triplecorr];
% ForcePC_triplecorr = [ForcePC_amp0_08_triplecorr;ForcePC_amp0_09_triplecorr;ForcePC_amp0_1_triplecorr;ForcePC_amp0_2_triplecorr;ForcePC_amp0_3_triplecorr;ForcePC_amp0_4_triplecorr;ForcePC_amp0_5_triplecorr;ForcePC_amp0_6_triplecorr;ForcePC_amp0_7_triplecorr;ForcePC_amp0_8_triplecorr;ForcePC_amp0_9_triplecorr;ForcePC_amp1_0_triplecorr];
ForcePC_triplecorr = [ForcePC_amp0_85_triplecorr;ForcePC_amp0_95_triplecorr;ForcePC_amp1_05_triplecorr;ForcePC_amp1_1_triplecorr];

%%

% Force_correction_0_05 = [ForcePC_amp0_05_uncorr;ForcePC_amp0_05_noampcorr;ForcePC_amp0_05_doublecorr;ForcePC_amp0_05_triplecorr;ForcePC_amp0_05_quadcorr];
% Force_correction_0_3  = [ForcePC_amp0_3_uncorr;ForcePC_amp0_3_noampcorr;ForcePC_amp0_3_doublecorr;ForcePC_amp0_3_triplecorr;ForcePC_amp0_3_quadcorr];
% 
% 
% for k=1:4
%     error005(:,k)=rmse(abs(Force_correction_0_05(k)),abs(Force_correction_0_05(k+1)));
%     error03(:,k)=rmse(abs(Force_correction_0_3(k)),abs(Force_correction_0_3(k+1)));
% end
%%
% for k=1:5
%     %error2_005(:,k)=mean(abs(Force_correction_0_05(k))-ones(length(Force_correction_0_05(k)))*rms(abs(Force_correction_0_05(k))));
%     std_03(:,k)=std(abs(Force_correction_0_3(k,:)));
%     var_03(:,k)=var(abs(Force_correction_0_3(k,:)));
%     std_005(:,k)=std(abs(Force_correction_0_05(k,:)));
% 
% end

%%
%amp_levels=[0.05]% 0.06 0.07 0.08 0.09 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
%amp_levels=[0.08 0.09 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
amp_levels=[0.85 0.95 1.05 1.1];

%amp_levels=[0.05 0.06 0.07 0.08 0.09 0.1 0.2 0.3 0.4 0.5 0.6];
%amp_levels=[1.0];
for k=1:length(amp_levels)

    F_flat=amp_levels(k)*ones(1,length(ForcePC_amp0_85_noampcorr(384:end)));

    F_to_apply=(ForcePC_no_ampcorrR2(k,384:end).*(F_flat.^3))./(ForcePC_no_ampcorr(k,384:end).*ForcePC_doublecorr(k,384:end).*ForcePC_triplecorr(k,384:end));
    F_to_apply_normalized(k,:)=abs(F_to_apply)./mean(abs(F_to_apply));
    F_to_apply_normalized_final=[freqp(384:end)' (smoothdata(F_to_apply_normalized(k,:),"gaussian",50))'];
    save(['InvLoadEstimation_Test_Results/Corrected_After_Reattachment/Quadruple Correction Files/Higher Loads/QuadrupleAmpCorrection',num2str(k),'.txt'],'F_to_apply_normalized_final','-ascii');

end
%%
figure(1)
for k=1:length(amp_levels)
    plot(freqp(384:end)',(smoothdata(F_to_apply_normalized(k,:),"gaussian",50))')
    hold on
end
legend 
xlabel("Frequency(Hz)")
ylabel("Amplitude Correction to be Applied (V)")




%%
for k=1:length(amp_levels)

    system(['copy /b preamble.txt+QuadrupleAmpCorrection',num2str(k),'.txt Correction_',num2str(k),'.txt']);

end
%%
save("amp_correction_1.mat","")
%%
[freqp,ForcePC_amp0_7_ampcorr_double]=GetPointData('InvLoadEstimation_Test_Results/scan4/scan_1_0.7V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_8_ampcorr_double]=GetPointData('InvLoadEstimation_Test_Results/scan4/scan_2_0.8V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_9_ampcorr_double]=GetPointData('InvLoadEstimation_Test_Results/scan4/scan_3_0.9V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_ampcorr_double]=GetPointData('InvLoadEstimation_Test_Results/scan4/scan_4_1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);

[freqp,ForcePC_amp0_7_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/scan3/scan_1_0.7V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_8_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/scan3/scan_2_0.8V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp0_9_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/scan3/scan_3_0.9V.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,ForcePC_amp1_0_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/scan3/scan_4_1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);

figure(1)
plot(freqp,abs(ForcePC_amp0_7_noampcorr),'o',freqp,abs(ForcePC_amp0_8_noampcorr),'o',freqp,abs(ForcePC_amp0_9_noampcorr),'o',freqp,abs(ForcePC_amp1_0_noampcorr),'o')
hold on
plot(freqp,abs(ForcePC_amp0_7_ampcorr),freqp,abs(ForcePC_amp0_8_ampcorr),freqp,abs(ForcePC_amp0_9_ampcorr),freqp,abs(ForcePC_amp1_ampcorr))

%plot(freqp,abs(ForcePC_amp0_7_ampcorr_double),'--',freqp,abs(ForcePC_amp0_8_ampcorr_double),'--',freqp,abs(ForcePC_amp0_9_ampcorr_double),'--',freqp,abs(ForcePC_amp1_ampcorr_double),'--')
%ylim([0 0.02])
%%
[freqp,TF_PC_amp0_7_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/scan3/scan_1_0.7V.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);
[freqp,TF_PC_amp0_8_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/scan3/scan_2_0.8V.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);
[freqp,TF_PC_amp0_9_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/scan3/scan_3_0.9V.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);
[freqp,TF_PC_amp1_noampcorr]=GetPointData('InvLoadEstimation_Test_Results/scan3/scan_4_1V.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);
figure(2)
plot(freqp,abs(TF_PC_amp0_7_noampcorr),'-')%,freqp,abs(TF_PC_amp0_8_noampcorr),'-o',freqp,abs(TF_PC_amp0_9_noampcorr),'-o',freqp,abs(TF_PC_amp1_noampcorr),'-o')


%%

figure(1)
plot(freqp,abs(Forcess36amp0_1_noampcorr),freqp,abs(Forcess36amp0_1_Flat),freqp,abs(Forcess36amp0_1_Ref2))
legend("No Amplitude Correction","Amp Correction to get Flat Signal","Amp Correction to get Ref2 Signal")
xlabel("Frequency (Hz)")
ylabel("Force (N)")
title("Force Amplitude for the 0.1 V Signal")
grid on

figure(2)
plot(freqp,abs(Forcess36amp0_5_noampcorr),freqp,abs(Forcess36amp0_5_Flat),freqp,abs(Forcess36amp0_5_Ref2))
legend("No Amplitude Correction","Amp Correction to get Flat Signal","Amp Correction to get Ref2 Signal")
xlabel("Frequency (Hz)")
ylabel("Force (N)")
title("Force Amplitude for the 0.5 V Signal")
grid on

figure(3)
semilogy(freqp,abs(ypss36amp0_1_noampcorr),freqp,abs(ypss36amp0_1_Flat),'-o',freqp,abs(ypss36amp0_1_Ref2),'-*',freqp,abs(ypss36amp0_5_noampcorr),freqp,abs(ypss36amp0_5_Flat),freqp,abs(ypss36amp0_5_Ref2))
legend("No Amplitude correction 0.1 V","Amp Correction to get Flat 0.1 V Signal", "Amp Correction to get 0.1 V Ref2 Signal","No Amplitude correction 0.1 V", "Amp Correction to get Flat 0.5 V Signal", "Amp Correction to get 0.5 V Ref2 Signal")
xlabel("Frequency (Hz)")
ylabel("Amplitude (m/s/N)")
title("Transfer Function Amplitude with Amplitude Correction")
grid on
%%
figure(4)
semilogy(freqp,abs((Forcess36amp0_5_noampcorr)./(Forcess36amp0_5_noampcorrR2)),freqp,abs((Forcess36amp0_5_Flat)./(Forcess36amp0_5_FlatR2)))
legend("No Amp Correction","With Flat Amp Correction")
title("Effect of Amp Correction on the Transfer Function between Load Cell Force Output and Shaker Input")
xlabel("Frequency(Hz)")
ylabel("Amplitude(N/N)")
grid on

%%
for k=0.06:0.01:0.1
    
end