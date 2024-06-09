function [ niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,record,sto,sto_fit,archive,archive_fit,uFList,uCRList] = crowding( x,costX,stagList,bestfit,dim,sto,sto_fit,archive,archive_fit,uFList,uCRList,lb,ub)
T=30;
%% crowding
R=rand(1,dim).*(ub-lb)+lb;
flag=[];
sn=1;
niches=struct();
M=5;
NP=size(x,1);
while length(flag)~=NP
    dis=zeros(1,NP);
    for i=1:NP
        dis(i)=norm(x(i,:)-R);
    end
    dis(flag)=inf;
    [~,idx]=sort(dis);
    flag=[flag,idx(1:M)];
   
    niches(sn).idx=idx(1:M)';
    niches(sn).subcost=costX(idx(1:M));
    [~,seedidx]=max(niches(sn).subcost);
    niches(sn).seed=niches(sn).idx(seedidx);
    niches(sn).cost = costX(niches(sn).seed);
    niches(sn).num=M;
    sn=sn+1;
end

%% get the niche centers' fitness of niches and update bestfit
sub_nums = size(niches,2);
seed = zeros(1,sub_nums);
for i = 1 : sub_nums
    seed(i) = niches(i).seed;
    if costX(seed(i))>bestfit
        bestfit=costX(seed(i));
    end
end

%% NAAPS
initF=0.5;
initCR=0.5;
niche_erase=[];
pop_erase=[];
sto_erase=[];
record=zeros(1,length(seed));
for i=1:length(seed)
    if(isempty(sto))
        record(i)=1;
        sto=[sto;x(seed(i),:)];
        sto_fit=[sto_fit;costX(seed(i))];
        stagList=[stagList,0];
        uFList=[uFList;initF];
        uCRList=[uCRList;initCR];
        continue;
    end
    num=size(sto,1);
    dis=zeros(1,num);
    for j=1:num
        dis(j)=norm(x(seed(i),:)-sto(j,:));
    end
    [mindis,minidx]=min(dis);
    if mindis<=0.1
        record(i)=minidx;
        if costX(seed(i))>sto_fit(minidx)
            sto(minidx,:)=x(seed(i),:);
            sto_fit(minidx)=costX(seed(i));
            stagList(minidx)=0;
        end
        if stagList(minidx)>=T
            archive=[archive;sto(minidx,:)];
            archive_fit=[archive_fit;sto_fit(minidx)];
            sto_erase=[sto_erase;minidx];
            niche_erase=[niche_erase;i];
            pop_erase=[pop_erase;niches(i).idx];
        end           
    else
        sto=[sto;x(seed(i),:)];
        sto_fit=[sto_fit;costX(seed(i))];
        stagList=[stagList,0];
        uFList=[uFList;initF];
        uCRList=[uCRList;initCR];
        record(i)=length(uFList);
    end
end
stagList=stagList+1;