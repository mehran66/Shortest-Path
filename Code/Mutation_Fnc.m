function MutatPop=Mutation_Fnc(Pop,PopSize,MutatNum,ChromLenght,Dir_Cost,GenLength,node)
CrossPoint=GenLength*2;
tt=CrossPoint;
num=ceil(rand(1,MutatNum)*PopSize);
for ii=1:MutatNum
    temp=[];
    CrossPoint=tt;
    for jj=tt:ChromLenght-3*GenLength
       temp=Pop(num(ii),:);
    if temp(CrossPoint)==0
        temp(CrossPoint)=1;
        temp(CrossPoint+3)=1;
        temp(CrossPoint+4)=1;
        temp(CrossPoint+7)=1;
        
    else 
        temp(CrossPoint+1)=1;
        temp(CrossPoint+4)=1;
        temp(CrossPoint+7)=1;
    end
    Path=temp;
    C=Cost_Fnc(Path,Dir_Cost,GenLength,ChromLenght,node);
    if C~=0
        break;
    end
    CrossPoint=CrossPoint+1;
    end
    MutatPop(ii,:)=temp;
end