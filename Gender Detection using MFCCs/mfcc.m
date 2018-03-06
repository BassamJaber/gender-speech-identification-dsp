%Template for the function mfcc.m
function c = mfcc(s,fs)
% MFCC Calculate the mel frequencey cepstrum coefficients (MFCC) of a signal
%
% Inputs:
% s : speech signal
% fs : sample rate in Hz
%
% Outputs:
% c : MFCC output, each column contains the MFCC's for one speech frame
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Notes:
%%%%%%%%%%%%%%%%%%%%%%%%%%
%The mel-frequency cepstrum coefficients is defined as the result of the DCT on the log of mel-spectrum. In addtion we often exclude the zero-order
%cepstral coefficients. So the end part of the mfcc program would looks like:
% All previous steps...
% Obtain the mel-spectrum in the variable: ms
% Last step, compute mel-frequency cepstrum coefficients

sample1 = buffer(s,256,128);
[m n]= size(sample1);
h = hamming(256);

h = repmat(h,1,n);
sample1 = sample1 .* h;
sample = fft(sample1);
step1out = abs(sample(1:128,:)).^2;
m = melfb(20,256,12500);
step2out = m * step1out;
step3out = log(step2out);
step4out = dct(step3out);
c = step4out(1:12,:);

