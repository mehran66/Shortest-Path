function [Off1,Off2]=CrossOver_Fcn(Par1,Par2,GenLength,ChromLenght,Dir_Cost,node) 
mm=1;
while true
    a=(ceil(rand(1,1)*(length(Par1)-2*GenLength)))+GenLength;
    b=(ceil(rand(1,1)*(length(Par1)-2*GenLength)))+GenLength;
    if b==a
        continue
    end
    if b<=a
        c=a;
        b=c;
        a=b;
    end
    
    Par11=Par1(1:a);
    Par12=Par1(a+1:b);
    Par13=Par1(b+1:end);

    Par21=Par2(1:a);
    Par22=Par2(a+1:b);
    Par23=Par2(b+1:end);
    
    Off1=[Par11 Par22 Par13];
    
    C=Cost_Fnc(Off1,Dir_Cost,GenLength,ChromLenght,node);
    if mm==50
    break;
    end
    mm=mm+1;
    
    if C==0
        continue;
    else
        break;
    end

    
end
nn=1;
while true
    a=(ceil(rand(1,1)*(length(Par1)-2*GenLength)))+GenLength;
    b=(ceil(rand(1,1)*(length(Par1)-2*GenLength)))+GenLength;
    if b==a
        continue
    end
    if b<=a
        c=a;
        b=c;
        a=b;
    end
    
    Par11=Par1(1:a);
    Par12=Par1(a+1:b);
    Par13=Par1(b+1:end);

    Par21=Par2(1:a);
    Par22=Par2(a+1:b);
    Par23=Par2(b+1:end);
    
    Off2=[Par21 Par12 Par23];
    
    C=Cost_Fnc(Off2,Dir_Cost,GenLength,ChromLenght,node);
    if nn==50
        break;
    end
    nn=nn+1;
        if C==0
            continue;
        else
            break;
        end

end 


