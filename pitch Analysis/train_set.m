function [ female_avg,male_avg ] = train_set
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i = 1:100                    % train a VQ codebook for each speaker
   
    file = sprintf('train\\f (%d).wav',i);
    %disp(file);
   
[oldSignal, fs] = wavread(file);
newSignal=silenceremove(oldSignal, fs);



F0 = spAvgPitchCorr(newSignal, fs, 30, 20, [], 'plot');

avgfundemntalfreq=mean(F0)
female_avgFund(i)=avgfundemntalfreq;

end

female_avg=mean(female_avgFund)

for i = 1:100                     % train a VQ codebook for each speaker
   
    file = sprintf('train\\m (%d).wav',i);
    %disp(file);
  
[oldSignal, fs] = wavread(file);
newSignal=silenceremove(oldSignal, fs);



F0 = spAvgPitchCorr(newSignal, fs, 30, 20, [], 'plot');

avgfundemntalfreq=mean(F0)
male_arrFund(i)=avgfundemntalfreq;

end

male_avg=mean(male_arrFund)

end

