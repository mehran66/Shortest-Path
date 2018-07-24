function Dec=B2D_Fnc(Bin,ChromLenght,GenLength) 
Dec=[];
for ii=1:GenLength:(ChromLenght-GenLength)+1
    a=ii;b=ii+GenLength-1;
    temp1=Bin(a:b);
    temp2=bi2de(temp1);
    if temp2~=0
    Dec=[Dec,temp2];
    end
end