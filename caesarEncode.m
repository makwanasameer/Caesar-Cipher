function c = caesarEncode(p,key)
    c=zeros;
    %convert the string to ascii
    p=int16(p);
    for i=1:length(p)
        if p(i)== ' '
            %space should not be encrypted
            c(i)=p(i);
        else
            %convert the alphabets to start with base 0
            %a=0 b=1 .. z=25
            p(i)=p(i)-65;
            %Loop through A to Z using modulo and add key
            c(i)=mod((p(i)+key),26);
            %Again convert to ascii base
            c(i)=c(i)+65;
        end
    end   
    %Convert to character array
   c=char(c);
   %Convert to lower case
   c=lower(c);
end
