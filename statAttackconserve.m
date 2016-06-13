function [c, key] = statAttack(str,minCorr)

m=[0.080,0.015,0.030,0.040,0.130,0.020,0.015,0.060,0.065,0.005,0.005,0.035,0.030,0.070,0.080,0.020,0.002,0.065,0.060,0.090,0.030,0.010,0.015,0.005,0.020,0.002];

disp(length(m));
f=zeros;
letter=zeros;


   t=strfind(str,' '); 
   my_length=length(str)-length(t);
   disp('Total Length');
   disp(my_length);
   disp('length of space');
disp(length(t));
u=unique(str,'stable');
display('unique elements');
disp(u);
%for i=1:length(str)
for i=1:length(u)
    if u(i) == ' '
        continue;
    else
        k=strfind(str,u(i));
        letter(i)=u(i)-97;
        disp('letters ascii');
        disp(letter(i));
        f(i)=length(k)/my_length;
        disp('frequency');
        disp(f(i));
    end
end
phi=zeros;
sum=0;
for l=1:26
    for i=1:length(f)
        d=mod(  ( (letter(i)+1) -l) ,26);
        disp('values of d index of phi');
        disp(d);
        sum=sum+( f(i)* m(d+1));
    end
    phi(l)=sum;
    sum=0;
end
disp('phi values');
disp(phi);

key=zeros;
imp_phi=zeros;
flag=1;
%minCorr=0.0500;
for i=1:length(phi)
    if phi(i) > minCorr
        key(flag)=i-1;
        imp_phi(flag)=phi(i);
        flag=flag+1;
    end
    
end
disp('flag');
disp(flag);
disp('key');
disp(key);
disp('imp_phi');
disp(imp_phi);

disp('Decoded string');
c=zeros;
for i=1:length(key)
    g=char(samd(str,key(i)));
    c=char(c,g);
end
disp(c);
end

% function [p, key] = statAttack(c,minCorr)
% 
% Caesar cipher statistical attack function. Input must be lower case.
% 
% Example:
%     c = caesarEncode('HELLO WORLD',3);
%     [p, key] = statAttack(c,0.05);
% 