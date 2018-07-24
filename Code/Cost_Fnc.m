function C=Cost_Fnc(Path,Dir_Cost,GenLength,ChromLenght,node)
C=0;
temp1=Path(1:GenLength);
loop=[bi2de(temp1)];
for ii=GenLength+1:GenLength:(ChromLenght-GenLength)+1
    a=ii;b=ii+GenLength-1;
    temp2=Path(a:b);
    if bi2de(temp1)>node|bi2de(temp2)>node
        C=0;
        break;
    end
    if bi2de(temp2)==0
        continue;
    end
    if Dir_Cost(bi2de(temp1),bi2de(temp2))==0
        C=0;
        break;
    end
    
    if min(size(find(loop==bi2de(temp2))))~=0
        C=0;
        break;
    end
    loop=[loop,bi2de(temp2)];

    C=C+Dir_Cost(bi2de(temp1),bi2de(temp2));

    temp1=temp2;
    temp2=[];
end
 if C~=0
     C=1/C;
 end