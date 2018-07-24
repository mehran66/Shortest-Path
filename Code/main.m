%% Start of the program.
clc
clear
close all

%% Problem Statement (Shortest Path Problem)
Node=10;%Number of node
Path=(Node*(Node-1))*4;%Number of path
Source=1;%First point of path
Destination=7;%Last point of Path
%creat random pahh beetween Nodes and rando cost for them
From_rand=ceil(rand(1,Path)*Node);
To_rand=ceil(rand(1,Path)*Node);
W_rand =ceil( rand(1,Path)*100);
r(Node,Node)=[0];
Counter=1;
for ii=1:length(From_rand)
    if From_rand(ii)<To_rand(ii)
        r(From_rand(ii),To_rand(ii))=W_rand(ii);
        From(Counter)=From_rand(ii);
        To(Counter)=To_rand(ii);
        W(Counter)=W_rand(ii);
        Counter=Counter+1;
    end
end          
Dir_Cost=r+r';
h = view(biograph(Dir_Cost,[],'ShowWeights','on','ShowArrows','off'));
%% Algoritm Parameters
PopSize = 100;
Gens = de2bi((1:Node)');
[bb,GenLength]=size(Gens);
ChromLenght = GenLength*Node;
KeepPercent = 30/100; 
CrossPercent = 40/100;
MutatPercent = 1 - KeepPercent - CrossPercent;
SelectionMode=1; %1: Tornoment selection
                 %2: Random pairing
                 %3: Roulette Wheel
KeepNum = round(KeepPercent * PopSize);
CrossNum = round(CrossPercent * PopSize);
MutatNum = PopSize - KeepNum - CrossNum;

%% Initial Population
[Pop1 Cost1]=Pop_Fnc(Dir_Cost,PopSize,Source,Destination,GenLength,ChromLenght,Gens,Node);
 [Cost1 Index1]=sort(Cost1,'descend');
 Pop1=Pop1(Index1,:);
 [Pop2 Cost2]=Pop_Fnc(Dir_Cost,PopSize,Source,Destination,GenLength,ChromLenght,Gens,Node);
 [Cost2 Index2]=sort(Cost2,'descend');
 Pop2=Pop2(Index2,:);
 Pop=[Pop1(1:PopSize/2,:);Pop2(1:PopSize/2,:)];
 Cost=[Cost1(1:PopSize/2) Cost2(1:PopSize/2)];
 [Cost Index]=sort(Cost,'descend');
 Pop=Pop(Index,:);
%% MAIN LOOP
MaxIteration=20;
MinMat=[];
MeanMat=[];
for Iter = 1:MaxIteration
    %% Select Keep
    KeepPop=Pop(1:KeepNum,:);
    %% CrossOver
    SelectedIndexes=SelectParents_Fcn(Cost,CrossNum,SelectionMode);
   CrossPop=[];
    for ii=1:2:CrossNum
        Par1Index=SelectedIndexes(ii);
        Par2Index=SelectedIndexes(ii+1);
        Par1=Pop(Par1Index,:);
        Par2=Pop(Par2Index,:);
        [Off1,Off2]=CrossOver_Fcn(Par1,Par2,GenLength,ChromLenght,Dir_Cost,Node);
        CrossPop=[CrossPop;Off1;Off2];
    end
    %% Mutation
    MutatPop=Mutation_Fnc(Pop,PopSize,MutatNum,ChromLenght,Dir_Cost,GenLength,Node);
   
          %% NewPopulation
    Pop=[KeepPop;CrossPop;MutatPop];
    [a,b]=size(Pop);
    for ii=1:a
        Path=Pop(ii,:);
        Cost(ii)=Cost_Fnc(Path,Dir_Cost,GenLength,ChromLenght,Node);
    end
     [Cost Index]=sort(Cost,'descend');
     Pop=Pop(Index,:);
     %% Reporoduction
    [Pop1 Cost1]=Pop_Fnc(Dir_Cost,PopSize,Source,Destination,GenLength,ChromLenght,Gens,Node);
     [Cost1 Index1]=sort(Cost1,'descend');
     Pop1=Pop1(Index1,:);
     Cost2=Cost; 
     Pop2=Pop;
     Pop=[Pop1(1:PopSize/2,:);Pop2(1:PopSize/2,:)];
     Cost=[Cost1(1:PopSize/2) Cost2(1:PopSize/2)];
     [Cost Index]=sort(Cost,'descend');
     Pop=Pop(Index,:);


     MinMat=[MinMat min(1./Cost)];
    
    
    % Display
    plot(MinMat,'r','linewidth',2.5);
    hold on;

    xlim([1 MaxIteration]);
    pause(0.05)
end

%% Final Result Display
disp('Genetic Algorithems');
BestSolution=B2D_Fnc(Pop(1,:),ChromLenght,GenLength)
BestCost=1/Cost(1)
%-------------------------------------------------------
disp('Dijkstra algorithm');
temp1=[];
temp2=[];
temp3=[];
for ii=1:(Node)-1
    for jj=ii+1:(Node)
        if Dir_Cost(ii,jj)~=0
        temp1=[temp1 ii];
        temp2=[temp2 jj];
        temp3=[temp3 Dir_Cost(ii,jj)];
        end
    end
end
From=temp1;
To=temp2;
W=temp3;
From=[temp1 temp2];
To=[temp2 temp1];
W=[W W];
DG=sparse(From,To,W,Node,Node);
[dist,Path,pred] = graphshortestpath(DG,Source,Destination)
if dist==inf
    disp('There is not any Path for you');
else
    
set(h.Nodes(Path),'Color',[1 0.4 0.4]);
edges = getedgesbynodeid(h,get(h.Nodes(Path),'ID'));
set(edges,'LineColor',[1 0 0]);
set(edges,'LineWidth',1.5);
end


X = rand(10,2);

scatter(X(:,1),X(:,2),5,'b')
axis square
