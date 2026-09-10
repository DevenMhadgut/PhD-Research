clc; clear; close all;
%%
load('')
%%
[freqp,TF_PC_0_05]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_1_0.05V.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);
[freqp,TF_PC_0_1]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_6_0.1V.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);
[freqp,TF_PC_0_5]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_4_0.5V.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);

[freqp,ForcePC_amp0_1_quadcorr]=GetPointData('InvLoadEstimation_Test_Results/Corrected/Corrected Quadruple/scan_6_0.1V.svd','FFT','Ref1','Force','Real & Imag.',0,0);

[freqp,TF_SS_0_1]=GetPointData('Test Signals/SineSweep_0_1.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);

[freqp,TF_Sine_0_1]=GetPointData('Test Signals/Sine_2_0_1.svd','FFT','Vib & Ref1','H1 Velocity / Force','Real & Imag.',0,0);
[freqp,vel_Sine_0_1]=GetPointData('Test Signals/Sine_2_0_1.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
[freqp,vel_Tri_0_1]=GetPointData('Test Signals/Triangle_2_0_1.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
[freqp,vel_Square_0_1]=GetPointData('Test Signals/Square_2_0_1.svd','FFT','Vib','Velocity','Real & Imag.',0,0);
[freqp,vel_BR_0_1]=GetPointData('Test Signals/Burst_Random_2_0_1.svd','FFT','Vib','Velocity','Real & Imag.',0,0);


[freqp,Force_Sine_0_1]=GetPointData('Test Signals/Sine_2_0_1.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,Force_Triangle_0_1]=GetPointData('Test Signals/Triangle_2_0_1.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,Force_Square_0_1]=GetPointData('Test Signals/Square_2_0_1.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,Force_BR_0_1]=GetPointData('Test Signals/Burst_Random_2_0_1.svd','FFT','Ref1','Force','Real & Imag.',0,0);

Forcecalc_sine1 = vel_Sine_0_1./TF_PC_0_1;
Forcecalc_tri1 = vel_Tri_0_1./TF_PC_0_1;
Forcecalc_square1 = vel_Square_0_1./TF_PC_0_1;
Forcecalc_br1 = vel_BR_0_1./TF_PC_0_1;


Forcecalc1_sine1t = [real(Forcecalc_sine1(1)), Forcecalc_sine1(2:end), ...
                 imag(Forcecalc_sine1(1)), conj(fliplr(Forcecalc_sine1(2:end)))];
Forcecalc1_sine1_real=ifft(Forcecalc1_sine1t,2*12800);

Force_Sine_0_1t = [real(Force_Sine_0_1(1)), Force_Sine_0_1(2:end), ...
                 imag(Force_Sine_0_1(1)), conj(fliplr(Force_Sine_0_1(2:end)))];
Force_Sine_0_1_real=ifft(Force_Sine_0_1t,2*12800);

Forcecalc_tri1t = [real(Forcecalc_tri1(1)), Forcecalc_tri1(2:end), ...
                 imag(Forcecalc_tri1(1)), conj(fliplr(Forcecalc_tri1(2:end)))];
Forcecalc_tri1_real=ifft(Forcecalc_tri1t,2*12800);

Force_Triangle_0_1t = [real(Force_Triangle_0_1(1)), Force_Triangle_0_1(2:end), ...
                 imag(Force_Triangle_0_1(1)), conj(fliplr(Force_Triangle_0_1(2:end)))];
Force_Triangle_0_1_real=ifft(Force_Triangle_0_1t,2*12800);
%%
Forcecalc_square1t = [real(Forcecalc_square1(1)), Forcecalc_square1(2:end), ...
                 imag(Forcecalc_square1(1)), conj(fliplr(Forcecalc_square1(2:end)))];
Forcecalc_square1_real=ifft(Forcecalc_square1t,2*12800);

Force_Square_0_1t = [real(Force_Square_0_1(1)), Force_Square_0_1(2:end), ...
                 imag(Force_Square_0_1(1)), conj(fliplr(Force_Square_0_1(2:end)))];
Force_Square_0_1_real=ifft(Force_Square_0_1t,2*12800);
%%
Forcecalc_br1t = [real(Forcecalc_br1(1)), Forcecalc_br1(2:end), ...
                 imag(Forcecalc_br1(1)), conj(fliplr(Forcecalc_br1(2:end)))];
Forcecalc_br1_real=ifft(Forcecalc_br1t,2*12800);

Force_BR_0_1t = [real(Force_BR_0_1(1)), Force_BR_0_1(2:end), ...
                 imag(Force_BR_0_1(1)), conj(fliplr(Force_BR_0_1(2:end)))];
Force_BR_0_1_real=ifft(Force_BR_0_1t,2*12800);
%%

ForcePC_amp0_1_quadcorrt = [real(ForcePC_amp0_1_quadcorr(1)), ForcePC_amp0_1_quadcorr(2:end), ...
                 imag(ForcePC_amp0_1_quadcorr(1)), conj(fliplr(ForcePC_amp0_1_quadcorr(2:end)))];
ForcePC_amp0_1_quadcorr_real=ifft(ForcePC_amp0_1_quadcorrt,2*12800);

vel_Sine_0_1t = [real(vel_Sine_0_1(1)), vel_Sine_0_1(2:end), ...
                 imag(vel_Sine_0_1(1)), conj(fliplr(vel_Sine_0_1(2:end)))];
vel_Sine_0_1_real=ifft(vel_Sine_0_1t,2*12800);


T=128/25600;
t = (0:length(Forcecalc1_sine1_real)-1)*T;




%%
figure(1)
plot(t,Forcecalc1_sine1_real*12800,t,Force_Sine_0_1_real*12800,LineWidth=3)
ax=gca;
ax.FontSize=20;
grid on
xlim([0 0.5])
legend ('Estimated Force','Measured Force')
xlabel('Time (s)')
ylabel('Force (N)')
title('Force Estimation using TF Inversion (Time History): Sine estimated from Periodic Chirp Transfer Function')
%%
figure(2)
plot(t,Forcecalc_tri1_real*12800,t,Force_Triangle_0_1_real*12800,LineWidth=3)
ax=gca;
ax.FontSize=20;
grid on
xlim([0 0.5])
legend ('Estimated Force','Measured Force')
xlabel('Time (s)')
ylabel('Force (N)')
title('Force Estimation using TF Inversion (Time History): Triangle estimated from Periodic Chirp Transfer Function')

%%
figure(3)
plot(t,Forcecalc_square1_real*12800,t,Force_Square_0_1_real*12800,LineWidth=3)
ax=gca;
ax.FontSize=20;
grid on
xlim([0 0.5])
legend ('Estimated Force','Measured Force')
xlabel('Time (s)')
ylabel('Force (N)')
title('Force Estimation using TF Inversion (Time History): Square estimated from Periodic Chirp Transfer Function')

figure(4)
plot(t,Forcecalc_br1_real*12800,t,Force_BR_0_1_real*12800,LineWidth=3)
ax=gca;
ax.FontSize=20;
grid on
xlim([8 8.5])
legend ('Estimated Force','Measured Force')
xlabel('Time (s)')
ylabel('Force (N)')
title('Force Estimation using TF Inversion (Time History): Burst Random estimated from Periodic Chirp Transfer Function')
%%
%save("sine.mat","Force1Ref1sine2amp1_real","vel1Ref1sine2amp1_real","disp1Ref1sine2amp1_real")

%%
%Vector Fitting

freq=2*pi*1i*freqp;
%TF_PC_0_1=TF_PC_0_1;
Ns=length(TF_PC_0_1);
N=50; % Order of approximation
Nsine=100;
w=freq/1i;
betTF_PC_0_05=linspace(w(1),w(Ns),N/2);
betTF_PC_0_1=linspace(w(1),w(Ns),N/2);
betTF_PC_0_5=linspace(w(1),w(Ns),N/2);
% betypsine27amp1=linspace(w(1),w(Ns),N/2);


%betypss11amp2=linspace(w(1),w(Ns),N/2);
    polesPC_0_05=[];
    polesPC_0_1=[];
    polesPC_0_5=[];
    % polesbr27amp1=[];
    % polessine27amp1=[];

    %polesypss11amp2=[];

for n=1:length(betTF_PC_0_05)
    alfPC_0_05=betTF_PC_0_05(n)*1e-2;
    polesPC_0_05=[polesPC_0_05 (-alfPC_0_05+i*betTF_PC_0_05(n)) (-alfPC_0_05-i*betTF_PC_0_05(n))];
end

for n=1:length(betTF_PC_0_1)
    alfPC_0_1=betTF_PC_0_1(n)*1e-2;
    polesPC_0_1=[polesPC_0_1 (-alfPC_0_1+i*betTF_PC_0_1(n)) (-alfPC_0_1-i*betTF_PC_0_1(n))];
end

for n=1:length(betTF_PC_0_5)
    alfPC_0_5=betTF_PC_0_5(n)*1e-2;
    polesPC_0_5=[polesPC_0_5 (-alfPC_0_5+i*betTF_PC_0_5(n)) (-alfPC_0_5-i*betTF_PC_0_5(n))];
end

% for n=1:length(betypbr27amp1)
%     alfbr27amp1=betypbr27amp1(n)*1e-2;
%     polesbr27amp1=[polesbr27amp1 (-alfbr27amp1+i*betypbr27amp1(n)) (-alfPC_0_1-i*betypbr27amp1(n))];
% end
% 

weightu=ones(1,Ns);
%Options
    opts.relax=0;      %Use vector fitting with relaxed non-triviality constraint
    opts.stable=1;     %Enforce stable poles
    opts.spy1=0; 
    opts.spy2=0; 
    opts.cmplx_ss = 0;
    opts.logx=0;       %Use logarithmic abscissa axis
    opts.logy=0;       %Use logarithmic ordinate axis 
    opts.errplot=1;    %Include deviation in magnitude plot
    opts.phaseplot=1;  %Also produce plot of phase angle (in addition to magnitiude)
    opt.legend=0;
    
    %z=[];
    Niter=50;
    PoleiterPC_0_05 = polesPC_0_05;
    PoleiterPC_0_1 = polesPC_0_1;
    PoleiterPC_0_5 = polesPC_0_5;

    % Poleiterbr27amp1 = polesbr27amp1;
   

    for iter=1:Niter
      disp(['   Iter ' num2str(iter)])  
      if iter==Niter, opts.legend=1;end
    
      %Vector Fitting

       [SERTF_PC_0_05,polesPC_0_05,rmserrTF_PC_0_05,fitTF_PC_0_05]=vectfit3((TF_PC_0_05),(freq),polesPC_0_05,weightu,opts);  
   
       PoleiterPC_0_05 = [PoleiterPC_0_05; polesPC_0_05];
          
    end

     for iter=1:Niter
      disp(['   Iter ' num2str(iter)])  
      if iter==Niter, opts.legend=1;end
    
      %Vector Fitting

       [SERTF_PC_0_1,polesPC_0_1,rmserrTF_PC_0_1,fitTF_PC_0_1]=vectfit3((TF_PC_0_1),(freq),polesPC_0_1,weightu,opts);  
   
       PoleiterPC_0_1 = [PoleiterPC_0_1; polesPC_0_1];
          
    end


     for iter=1:Niter
      disp(['   Iter ' num2str(iter)])  
      if iter==Niter, opts.legend=1;end
    
      %Vector Fitting

       [SERTF_PC_0_5,polesPC_0_5,rmserrTF_PC_0_5,fitTF_PC_0_5]=vectfit3((TF_PC_0_5),(freq),polesPC_0_5,weightu,opts);  
   
       PoleiterPC_0_5 = [PoleiterPC_0_5; polesPC_0_5];
          
    end


    % for iter=1:Niter
    %   disp(['   Iter ' num2str(iter)])  
    %   if iter==Niter, opts.legend=1;end
    % 
    %   %Vector Fitting
    % 
    %    [SERypbr27amp1,polebrs27amp1,rmserrypbr27amp1,fitypbr27amp1]=vectfit3((ypbr1amp1),(freq),polesbr27amp1,weightu,opts);  
    % 
    %    Poleiterbr27amp1 = [Poleiterbr27amp1; polebrs27amp1];
    % 
    % end


figure(5)

semilogy(freq./(2*pi*1i),abs(TF_PC_0_05),'b',LineWidth=3); 
%ylim([0 3000]);
hold on
semilogy(freq./(2*pi*1i),abs(fitTF_PC_0_05),'r-',LineWidth=2);
legend('Exp','V-Fit')
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/s/N)')
%xlim([0 50]);
title(['VF Transfer Function : Order ', num2str(N)])
grid on

figure(6)
semilogy(freq./(2*pi*1i),abs(TF_PC_0_1),'b',LineWidth=3); 
hold on
semilogy(freq./(2*pi*1i),abs(fitTF_PC_0_1),'r-',LineWidth=2);
legend('Exp','V-Fit')
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/s/N)')
%xlim([0 50]);
title(['VF Transfer Function : Order ', num2str(N)])
grid on

figure(7)
semilogy(freq./(2*pi*1i),abs(TF_PC_0_5),'b',LineWidth=3); 
%ylim([0 3000]);
hold on
semilogy(freq./(2*pi*1i),abs(fitTF_PC_0_5),'r-',LineWidth=2);
legend('Exp','V-Fit')
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/s/N)')
%xlim([0 50]);
title(['VF Transfer Function : Order ', num2str(N)])
grid on


%%
%State-space matrices
A_0_05=full(SERTF_PC_0_05.A);
B_0_05=SERTF_PC_0_05.B;
C_0_05=SERTF_PC_0_05.C;
D_0_05=SERTF_PC_0_05.D;
E_0_05=SERTF_PC_0_05.E;

A_0_1=full(SERTF_PC_0_1.A);
B_0_1=SERTF_PC_0_1.B;
C_0_1=SERTF_PC_0_1.C;
D_0_1=SERTF_PC_0_1.D;
E_0_1=SERTF_PC_0_1.E;

A_0_5=full(SERTF_PC_0_5.A);
B_0_5=SERTF_PC_0_5.B;
C_0_5=SERTF_PC_0_5.C;
D_0_5=SERTF_PC_0_5.D;
E_0_5=SERTF_PC_0_5.E;
%%

save("PC_VF_0_05.mat","A_0_05","B_0_05","C_0_05","D_0_05","E_0_05");
save("PC_VF_0_1.mat","A_0_1","B_0_1","C_0_1","D_0_1","E_0_1");
save("PC_VF_0_5.mat","A_0_5","B_0_5","C_0_5","D_0_5","E_0_5");
