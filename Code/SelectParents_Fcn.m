function SelectedIndexes=SelectParents_Fcn(Cost,SelectionNum,Mode)
switch Mode
    case 1%Tornoment selection
    PopSize=numel(Cost);
    for ii=1:SelectionNum
        R= randperm(PopSize);
        SI=R(1:4);
        CostSI=Cost(SI);
        F=find(CostSI==max(CostSI));F=F(1);
        SelectedIndexes(ii)=SI(F);
    end
    case 2 %Random pairing
    case 3 %Roulette Wheel
end
end