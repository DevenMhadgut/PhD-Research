clc;clear;close all;
%%
[freqp,ypss6amp5]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_6_amp5.svd','FFT','Vib & Ref1','H2 Velocity / Force','Real & Imag.',0,0);
[freqp,ypbc6amp5]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_6_amp5.svd','FFT','Vib & Ref1','H2 Velocity / Force','Real & Imag.',0,0);
[freqp,ypss11amp1]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_11_amp1.svd','FFT','Vib & Ref1','H2 Velocity / Force','Real & Imag.',0,0);
[freqp,ypss11amp2]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_11_amp2.svd','FFT','Vib & Ref1','H2 Velocity / Force','Real & Imag.',0,0);
[freqp,ypbc11amp1]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_11_amp1.svd','FFT','Vib & Ref1','H2 Velocity / Force','Real & Imag.',0,0);
[freqp,ypbc11amp2]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_11_amp2.svd','FFT','Vib & Ref1','H2 Velocity / Force','Real & Imag.',0,0);

%%
[freqp,Force6Ref1amp5]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_6_amp5.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,vel6Ref1amp5]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_6_amp5.svd','FFT','Vib','Velocity','Real & Imag.',0,0);

[freqp,Force11Ref1amp1]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_11_amp1.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,vel11Ref1amp1]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_11_amp1.svd','FFT','Vib','Velocity','Real & Imag.',0,0);

[freqp,Force11Ref1amp2]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_11_amp2.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,vel11Ref1amp2]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_Sine_Sweep_5avg_11_amp2.svd','FFT','Vib','Velocity','Real & Imag.',0,0);

[freqp,Force6Ref1bcamp5]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_6_amp5.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,vel6Ref1bcamp5]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_6_amp5.svd','FFT','Vib','Velocity','Real & Imag.',0,0);

[freqp,Force11Ref1bcamp1]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_11_amp1.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,vel11Ref1bcamp1]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_11_amp1.svd','FFT','Vib','Velocity','Real & Imag.',0,0);

[freqp,Force11Ref1bcamp2]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_11_amp2.svd','FFT','Ref1','Force','Real & Imag.',0,0);
[freqp,vel11Ref1bcamp2]=GetPointData('InvLoadEstimation_Test_Results/InputLoadEst_Hori_Flat_burst_chirp_5avg_11_amp2.svd','FFT','Vib','Velocity','Real & Imag.',0,0);

%%
Forcecalc6Ref1amp5=vel6Ref1amp5./ypss6amp5;
Forcecalc6Ref1bcamp5=vel6Ref1bcamp5./ypss6amp5;


Forcecalc11Ref1amp1=vel11Ref1amp1./ypss11amp1;
Forcecalc11Ref1bcamp1=vel11Ref1bcamp1./ypss11amp1;

Forcecalc11Ref1amp2=vel11Ref1amp2./ypss11amp2;
Forcecalc11Ref1bcamp2=vel11Ref1bcamp2./ypss11amp2;


%%
figure(1)
plot(freqp,abs(Forcecalc6Ref1bcamp5),freqp,abs(Force6Ref1bcamp5),LineWidth=3)

ax=gca;
ax.FontSize=20;
grid on
legend ('Estimated Force','Measured Force')
xlabel('Frequency (Hz)')
ylabel('Force (N)')
%title('Force Estimation using TF Inversion (Frequency)')
%%
Forcecalc6Ref1bcamp5=transpose(Forcecalc6Ref1bcamp5);
Force6Ref1bcamp5=transpose(Force6Ref1bcamp5);

Forcecalc6Ref1bcamp5t = [real(Forcecalc6Ref1bcamp5(1)); Forcecalc6Ref1bcamp5(2:end); ...
                 imag(Forcecalc6Ref1bcamp5(1)); conj(flipud(Forcecalc6Ref1bcamp5(2:end)))];
ForcerealRef1bcamp5=ifft(Forcecalc6Ref1bcamp5t,2*12800);

Force6Ref1bcamp5t = [real(Force6Ref1bcamp5(1)); Force6Ref1bcamp5(2:end); ...
                 imag(Force6Ref1bcamp5(1)); conj(flipud(Force6Ref1bcamp5(2:end)))];
ForceRef1bcamp5=ifft(Force6Ref1bcamp5t,2*12800);

T=1/1000;
t = (0:length(ForcerealRef1bcamp5)-1)*T;

figure(2)
plot(t,ForcerealRef1bcamp5*25600,t,ForceRef1bcamp5*25600,LineWidth=3)
ax=gca;
ax.FontSize=20;
grid on
xlim([0 25.6])
legend ('Estimated Force','Measured Force')
xlabel('Time (s)')
ylabel('Force (N)')
%title('Force Estimation using TF Inversion (Time History)')
%%
Forcecalc11Ref1bcamp1=transpose(Forcecalc11Ref1bcamp1);
Force11Ref1bcamp1=transpose(Force11Ref1bcamp1);
vel11Ref1amp1=transpose(vel11Ref1amp1);
Force11Ref1amp1=transpose(Force11Ref1amp1);

Forcecalc11Ref1bcamp1t = [real(Forcecalc11Ref1bcamp1(1)); Forcecalc11Ref1bcamp1(2:end); ...
                 imag(Forcecalc11Ref1bcamp1(1)); conj(flipud(Forcecalc11Ref1bcamp1(2:end)))];
ForcerealRef1bcamp1=ifft(Forcecalc11Ref1bcamp1t,2*12800);

Force11Ref1amp1t = [real(Force11Ref1amp1(1)); Force11Ref1amp1(2:end); ...
                 imag(Force11Ref1amp1(1)); conj(flipud(Force11Ref1amp1(2:end)))];
ForcerealRef1amp1=ifft(Force11Ref1amp1t,2*12800);

vel11Ref1amp1t = [real(vel11Ref1amp1(1)); vel11Ref1amp1(2:end); ...
                 imag(vel11Ref1amp1(1)); conj(flipud(vel11Ref1amp1(2:end)))];
velrealRef1amp1=ifft(vel11Ref1amp1t,2*12800);

Force11Ref1bcamp1t = [real(Force11Ref1bcamp1(1)); Force11Ref1bcamp1(2:end); ...
                 imag(Force11Ref1bcamp1(1)); conj(flipud(Force11Ref1bcamp1(2:end)))];
ForceRef1bcamp1=ifft(Force11Ref1bcamp1t,2*12800);

T=1/1000;
t = (0:length(ForcerealRef1bcamp1)-1)*T;

figure(3)
plot(t,ForcerealRef1bcamp1*25600,t,ForceRef1bcamp1*25600,LineWidth=3)
ax=gca;
ax.FontSize=20;
grid on
xlim([0 25.6])
legend ('Estimated Force','Measured Force')
xlabel('Time (s)')
ylabel('Force (N)')
title('Force Estimation using TF Inversion (Time History): Burst Chirp estimated from Sine Sweep Transfer Function')

%%
Forcecalc11Ref1bcamp2=transpose(Forcecalc11Ref1bcamp2);
Force11Ref1bcamp2=transpose(Force11Ref1bcamp2);

Forcecalc11Ref1bcamp2t = [real(Forcecalc11Ref1bcamp2(1)); Forcecalc11Ref1bcamp2(2:end); ...
                 imag(Forcecalc11Ref1bcamp2(1)); conj(flipud(Forcecalc11Ref1bcamp2(2:end)))];
ForcerealRef1bcamp2=ifft(Forcecalc11Ref1bcamp2t,2*12800);

Force11Ref1bcamp2t = [real(Force11Ref1bcamp2(1)); Force11Ref1bcamp2(2:end); ...
                 imag(Force11Ref1bcamp2(1)); conj(flipud(Force11Ref1bcamp2(2:end)))];
ForceRef1bcamp2=ifft(Force11Ref1bcamp2t,2*12800);

T=1/1000;
t = (0:length(ForcerealRef1bcamp2)-1)*T;

figure(4)
plot(t,ForcerealRef1bcamp2*25600,t,ForceRef1bcamp2*25600,LineWidth=3)
ax=gca;
ax.FontSize=20;
grid on
xlim([0 25.6])
legend ('Estimated Force','Measured Force')
xlabel('Time (s)')
ylabel('Force (N)')
%title('Force Estimation using TF Inversion (Time History)')

figure(5)
plot(freqp,abs(Forcecalc11Ref1bcamp1),freqp,abs(Force11Ref1bcamp1),LineWidth=3)
xlim([0 50])
ax=gca;
ax.FontSize=20;
grid on
legend ('Estimated Force','Measured Force')
xlabel('Frequency (Hz)')
ylabel('Force (N)')
%title('Force Estimation using TF Inversion (Frequency)')

figure(6)
plot(freqp,abs(Forcecalc11Ref1bcamp2),freqp,abs(Force11Ref1bcamp2),LineWidth=3)
xlim([0 50])
ax=gca;
ax.FontSize=20;
grid on
legend ('Estimated Force','Measured Force')
xlabel('Frequency (Hz)')
ylabel('Force (N)')
%title('Force Estimation using TF Inversion (Frequency)')

%%
freq=2*pi*1i*freqp(1:12800);
ypss11amp1=ypss11amp1(1:12800);ypss11amp2=ypss11amp2(1:12800);
Ns=length(ypss11amp1);
N=40; % Order of approximation
w=freq/1i;
betypss11amp1=linspace(w(1),w(Ns),N/2);
betypss11amp2=linspace(w(1),w(Ns),N/2);

    polesypss11amp1=[];
    polesypss11amp2=[];

for n=1:length(betypss11amp1)
    alfypss11amp1=betypss11amp1(n)*1e-2;
    polesypss11amp1=[polesypss11amp1 (-alfypss11amp1+i*betypss11amp1(n)) (-alfypss11amp1-i*betypss11amp1(n))];
end

for n=1:length(betypss11amp2)
    alfypss11amp2=betypss11amp2(n)*1e-2;
    polesypss11amp2=[polesypss11amp2 (-alfypss11amp2+i*betypss11amp2(n)) (-alfypss11amp2-i*betypss11amp2(n))];
end

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
    Poleiter11amp1 = polesypss11amp1;
    Poleiter11amp2 = polesypss11amp2;
    for iter=1:Niter
      disp(['   Iter ' num2str(iter)])  
      if iter==Niter, opts.legend=1;end
    
      %Vector Fitting

       [SERypss11amp1,polesypss11amp1,rmserrypss11amp1,fitypss11amp1]=vectfit3((ypss11amp1),(freq),polesypss11amp1,weightu,opts);  
   
       Poleiter11amp1 = [Poleiter11amp1; polesypss11amp1];
          
    end

    for iter=1:Niter
      disp(['   Iter ' num2str(iter)])  
      if iter==Niter, opts.legend=1;end
    
      %Vector Fitting

       [SERypss11amp2,polesypss11amp2,rmserrypss11amp2,fitypss11amp2]=vectfit3((ypss11amp2),(freq),polesypss11amp2,weightu,opts);  
   
       Poleiter11amp2 = [Poleiter11amp2; polesypss11amp2];
          
    end 

figure(7)
plot(real(polesypss11amp1),imag(polesypss11amp1),'o')
hold on
plot(real(polesypss11amp2),imag(polesypss11amp2),'o')

legend('Location','best')
xlabel('Real','fontweight','bold')
ylabel('Imaginary','fontweight','bold')
title('Poles','fontweight','bold')
grid on
%%
figure(8)
%plot(freq./(2*pi*i),abs(ypss11amp1),freq./(2*pi*i),abs(fitypss11amp1))
% xlim([0 50])
semilogy(freq./(2*pi*i),abs(ypss11amp1),'b',LineWidth=3); 
%ylim([0 3000]);
hold on
semilogy(freq./(2*pi*i),abs(fitypss11amp1),'r-',LineWidth=2);
legend('Exp','V-Fit')
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/s/N)')
%xlim([0 50]);
title('Vector-Fit Transfer Function')
grid on
%%
figure(9)
plot(t,velrealRef1amp1);
grid on
%%
Ax11amp1=full(SERypss11amp1.A);
Bx11amp1=SERypss11amp1.B;
Cx11amp1=SERypss11amp1.C;
Dx11amp1=SERypss11amp1.D;
Ex11amp1=SERypss11amp1.E;

Ax11amp2=full(SERypss11amp2.A);
Bx11amp2=SERypss11amp2.B;
Cx11amp2=SERypss11amp2.C;
Dx11amp2=SERypss11amp2.D;
Ex11amp2=SERypss11amp2.E;
% figure(10)
% semilogy(freq(:,1)./(2*pi*i),abs(H(1:640,1)),'b',LineWidth=3); 
% xlim([0 50]);
% %ylim([0 3000]);
% hold on

% semilogy(freq(:,1),abs(fitx4w),'k-',LineWidth=2);
save ('vf_inp.mat',"Ax11amp1","Bx11amp1","Cx11amp1","Dx11amp1","Ex11amp1","Ax11amp2","Bx11amp2","Cx11amp2","Dx11amp2","Ex11amp2","vel11Ref1amp1","vel11Ref1amp2","velrealRef1amp1","t","ForcerealRef1amp1");

%%
%[U,S,V]=csvd(ypss11amp1);
%%
%[x_lambda,rho,eta]=tikhonov(U,S,V',vel11Ref1amp1,0.1);
%%
%x_lsqr=lsqr(diag(ypss11amp1),vel11Ref1amp1);
%%
%x_lsqminnorm=lsqminnorm(diag(ypss11amp1),vel11Ref1amp1');