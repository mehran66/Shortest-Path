function [Pop Cost]  = Pop_Fnc(Dir_Cost,PopSize,Source,Destination,GenLength,ChromLenght,Gens,node)
%Make Population and their cost
yy=Gens;
yy(Source,:)=[];
if Destination>Source
    yy(Destination-1,:)=[];
else
    yy(Destination,:)=[];
end
[l1,l2]=size(yy);

zz1=zeros(round(l1/3),l2);
yy1=[yy;zz1];

zz2=zeros(l1,l2);
yy2=[yy;zz2];

zz3=zeros(3*l1,l2);
yy3=[yy;zz3];

Counter=1;
while true
    temp=[];
    if Counter>PopSize;
        break;
    end
    if Counter<=round(PopSize/3)
    num=randperm((node-2)+round(l1/3));
    for ii=1:node-2
        temp=[temp yy1(num(ii),:)];
    end
    end
    if Counter<=round(PopSize/2)&&Counter>=(round(PopSize/3))+1
    num=randperm((node-2)*2);
    for ii=1:node-2
        temp=[temp yy2(num(ii),:)];
    end
        end
    if Counter>=round(PopSize/2)+1
    num=randperm((node-2)*4);
    for ii=1:node-2
        temp=[temp yy3(num(ii),:)];
    end
    end
    Path=[Gens(Source,:),temp,Gens(Destination,:)];

    %Compute cost for a one individual
    C=Cost_Fnc(Path,Dir_Cost,GenLength,ChromLenght,node);
        if C~=0
            Cost(Counter)=C;
            Pop(Counter,:)=Path;
            Counter=Counter+1;
        end
end


% function [Pop Cost]  = Pop_Fnc(Dir_Cost,PopSize,Source,Destination,GenLength,ChromLenght,Gens,node)
% %Make Population and their cost
% yy=Gens;
% yy(Source,:)=[];
% if Destination>Source
%     yy(Destination-1,:)=[];
% else
%     yy(Destination,:)=[];
% end
% [l1,l2]=size(yy);
% zz=zeros(3*l1,l2);
% yy=[yy;zz];
% Counter=1;
% while true
%     temp=[];
%     if Counter>PopSize;
%         break;
%     end
%     num=randperm((node-2)*3);
%     for ii=1:node-2
%         temp=[temp yy(num(ii),:)];
%     end
%     Path=[Gens(Source,:),temp,Gens(Destination,:)];
% 
%     %Compute cost for a one individual
%     C=Cost_Fnc(Path,Dir_Cost,GenLength,ChromLenght,node);
%         if C~=0
%             Cost(Counter)=C;
%             Pop(Counter,:)=Path;
%             Counter=Counter+1;
%         end
% end