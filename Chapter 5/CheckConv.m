clc; clear; close all;
%%
% Example: remove samples before index n0 in frequency domain
x = randn(1,1024);  % Example signal
n0 = 300;           % Index after which to keep data

% Create a rectangular window in time domain
w = zeros(size(x));
w(n0:end) = 1;

% Transform window to frequency domain
W = fft(w);

% FFT of the signal
X = fft(x);

% Convolution in frequency domain (multiplication in time domain)
X_cut = conv(X,W);  % Elementwise multiply
x_cut_time=x.*w;
% IFFT back to time domain
x_cut = ifft(X_cut, 'symmetric');
x_cut_short=x_cut(n0:end);
% Plot to compare
figure(1)
subplot(2,1,1)
plot(x)
title('Original Signal');
subplot(2,1,2)
plot(300:1024,x_cut_short)
title('Signal After Removing Data Before n0 (via Frequency Domain)');
