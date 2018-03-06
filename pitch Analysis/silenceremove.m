function [ sig ] = silenceremove( s,fs )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% step 1 : break the signal to frames
frame_dur=0.1;
frame_len=frame_dur*fs;
N= length(s);
frame_num=floor(N/frame_len);

new_sig= zeros(N,1);
count=0;
for k = 1 :frame_num
    frame = s( (k-1)*frame_len+1 : frame_len*k);
    %step 2 identifies silence by finding frames with max amplitude less than
%0.03 
max_val=max(frame);
if(max_val >0.03)
  count=count+1;
  new_sig( (count-1)*frame_len+1 : frame_len*count)=frame;
end


% creat a new signal 
end
new_sig(count*frame_len+1:end)=[];
sig=new_sig;
end