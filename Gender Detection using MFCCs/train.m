function [m,f] = train(traindir, n)
% Speaker Recognition: Training Stage
%
% Input:
%       traindir : string name of directory contains all train sound files
%       n        : number of train files in traindir
%
% Output:
%       
%
% Note:
%       Sound files in traindir is supposed to be: 
%                       s1.wav, s2.wav, ..., sn.wav
% Example:
%       >> code = train('C:\data\train\', 8);

k = 1024;                      % number of centroids required

male = zeros(12, 1) ;       % 1-by-12 matrix of random values
female=zeros(12,1);

for i = 1:n                     % train a VQ codebook for each speaker
    if i <=n/2
    file = sprintf('%sf (%d).wav', traindir, i); 
    else 
    file = sprintf('%sm (%d).wav', traindir, (i-(n/2))); 
    end
    disp(file);
   
    [s, fs] = wavread(file);
    ns=silenceremove(s, fs);
    
    v = mfcc(ns,fs);            % Compute MFCC's
    
    if i<=n/2
      male = horzcat(v,male);
    else
       female=horzcat(v,female);
    end
  
end

[male,esq,j] = kmeans(male',k);
[female,esq,j] = kmeans(female',k);



[x,y]=size(male);
[m,n]=size(female);
A=zeros(k,1);
B=zeros(k,1);

% reshape(male,x*y,1);
% reshape(female,x*y,1);
% 

for i=1:k
    A(i)=mean(male(i,:)');
    B(i)=mean(female(i,:)');
end
m=A;
f=B;




