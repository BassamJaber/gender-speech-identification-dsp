function  test(femalePitch,MalePitch)
for i = 1:20                     
   
    file = sprintf('test\\s (%d).wav',i);

   
[signal, fs] = wavread(file);

new_signal=silenceremove(signal, fs);
F0= spAvgPitchCorr(new_signal, fs, 30, 20, [], 'plot');

avgPitchFreq=mean(F0);
if(abs(avgPitchFreq-femalePitch)<abs(avgPitchFreq-MalePitch))
       disp('female');
else 
       disp('male'); 

end
end
end

