function p = samd(c,key)
   p=zeros;
    c=int16(c);
    for i=1:length(c)
        if c(i)== ' '
            p(i)=c(i);
        else
            c(i)=c(i)-97;
            p(i)=mod((c(i)-key),26);
            p(i)=p(i)+97;
        end
    end
   p=char(p);
   p=upper(p);
end 