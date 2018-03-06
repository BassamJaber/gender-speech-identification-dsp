function test(testdir, n, m,f)
% Speaker Recognition: Testing Stage
%
% Input:
%       testdir : string name of directory contains all test sound files
%       n       : number of test files in testdir
%       
%
% Note:
%       Sound files in testdir is supposed to be: 
%               s1.wav, s2.wav, ..., sn.wav
%
% Example:
%       >> test('C:\data\test\', 8, code);

for k = 1:n                     % read test sound file of each speaker
    file = sprintf('%ss (%d).wav', testdir, k);
    [s, fs] = wavread(file);      
    
    v = mfcc(s, fs);            % Compute MFCC's
       
    [x,y]=size(v);
    sumMale=0;
    [n,p]=size(m);
    
    for i=1:x
        for l=1:n
        min1=9999;
        for j=1:y
            if abs(v(i,j)-m(l)) <min1
               min1= abs(v(i,j)-m(l));
            end 
           end
         sumMale=sumMale+min1;
        end
    end
    
    
    sumFemale=0;
    for i=1:x
        for l=1:n
        min1=999999;
          for j=1:y
             if abs(v(i,j)-f(l))<min1
                 min1=abs(v(i,j)-f(l));
             end
          end
           sumFemale=sumFemale+min1;
        end
    end
%     
%    sumMale=sumMale
%    sumFemale=sumFemale
%    x=abs(sumMale-sumFemale)
    if(sumFemale<sumMale)
            msg = sprintf('female');
    else
             msg = sprintf('male');
   end
    disp(msg);
end
end
