function [c, key] = statAttack(str,minCorr)
%This shows unigrams in English Dictionary as array
m=[0.080,0.015,0.030,0.040,0.130,0.020,0.015,0.060,0.065,0.005,0.005,0.035,0.030,0.070,0.080,0.020,0.002,0.065,0.060,0.090,0.030,0.010,0.015,0.005,0.020,0.002];

f=zeros;
letter=zeros;
  
t=strfind(str,' '); 
%Calculate length of the encrypted string without spaces
my_length=length(str)-length(t);
%Obtain unique elements in the array u   
u=unique(str,'stable');

%Calculate the frequency of the letters without space as an character 
for i=1:length(u)
    if u(i) == ' '
        continue;
    else
        k=strfind(str,u(i));
        %Convert the base to 0 from ASCII and maintain
        %letter array that contains letters corresponding values starting
        %from a-z 0-25
        letter(i)=u(i)-97;
        f(i)=length(k)/my_length;      
    end
end
phi=zeros;
sum=0;
%Calculate the phi(i)=summation( F(c) * p(c-i) )
for l=1:26
    for i=1:length(f)
        %calculate indexing into m
        d=mod(  ( (letter(i)+1) -l) ,26);
        sum=sum+( f(i)* m(d+1));
    end
    phi(l)=sum;
    sum=0;
end

key=zeros;
imp_phi=zeros;
flag=1;
%Obtain array of phi(i) values and
%key values that are greater than minCorr
for i=1:length(phi)
    if phi(i) > minCorr
        key(flag)=i-1;
        imp_phi(flag)=phi(i);
        flag=flag+1;
    end
    
end
%Decode the encrypted text using Caesar Cypher function
%for values of phi(i) > minCorr and obtain keys
c=zeros;
for i=1:length(key)
    g=char(caesarDecode(str,key(i)));
    %Performs concatenation of possible decrypted text
    c=char(c,g);
end
end