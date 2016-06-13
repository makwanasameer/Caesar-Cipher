function p = caesarDecode(c,key)
   p=zeros;
   %convert the string to ascii
    c=int16(c);
    for i=1:length(c)
        if c(i)== ' '
            %space should not be decrypted
            p(i)=c(i);
        else
            %convert the alphabets to start with base 0
            %a=0 b=1 .. z=25
            c(i)=c(i)-97;
            %Loop through A to Z using modulo and apply key
            p(i)=mod((c(i)-key),26);
            %Again convert to ascii base
            p(i)=p(i)+97;
        end
    end
    %Convert to character array
   p=char(p);
   %Convert to upper case
   p=upper(p);
end 