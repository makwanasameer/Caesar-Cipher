function c = sam(p,key)
    c=zeros;
    p=int16(p);
    for i=1:length(p)
        if p(i)== ' '
            c(i)=p(i);
        else
            p(i)=p(i)-65;
            c(i)=mod((p(i)+key),26);
            c(i)=c(i)+65;
        end
    end    
   c=char(c);
   c=lower(c);
end
