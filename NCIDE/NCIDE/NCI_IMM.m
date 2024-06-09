function [ niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,record,sto,sto_fit,archive,archive_fit,uFList,uCRList] = NCI_IMM( x,costX,stagList,bestfit,FEs,MaxFEs,sto,sto_fit,archive,archive_fit,uFList,uCRList)
%% calculate Kֵ
Kinit=5;
T=30;
if FEs<0.5*MaxFEs
   k=Kinit;
else 
   k=2*Kinit;
end
%% NCI
popsize=size(x,1);
slbest=zeros(popsize,2);
slbest(:,1)=1:popsize;
matdis=pdist2(x,x);
matdis(logical(eye(popsize))) = inf;
scoreBoard=zeros(1,popsize);
for i=1:popsize
    [~,idx]=sort(matdis(i,:));
    for j=1:k
       if costX(i)>=costX(idx(j))
           scoreBoard(idx(j))=scoreBoard(idx(j))+1;
       else
           scoreBoard(i)=scoreBoard(i)+1;
       end
    end
end
% the whole population is a niche if there is no niche center without defeat
%record.
niches_seed=find(scoreBoard==0);
if isempty(niches_seed)
    [~,bestidx]=max(costX);
    niches_seed=[niches_seed,bestidx];
end
% merge individuals not niche centers into their closest niche centers.
slbest(niches_seed,2)=slbest(niches_seed,1);
for i=1:popsize
    if slbest(i,2)==0
       [~,minidx]=min(matdis(i,niches_seed));
       slbest(i,2)=niches_seed(minidx);
    end
end
sgbest = zeros(popsize,2);
sgbest(:,1) = 1:popsize;
for i = 1:popsize
    j = slbest(i,2);
    k = slbest(i,1);
    while j~= k
          k = j;
          j = slbest(k,2);
    end
    sgbest(i,2) = k;
end
%determine the best individual within each niche(namely seed)
seed_index = unique(sgbest(:,2));
seed_len = length(seed_index);
niches  = struct();
cost_seed = zeros(1,seed_len);
for i = 1:seed_len
    niches(i).seed = seed_index(i);
    niches(i).idx= find(sgbest(:,2)==seed_index(i));
    niches(i).num = length(niches(i).idx);
    niches(i).cost = costX(seed_index(i));
    niches(i).subcost = costX(niches(i).idx);
    cost_seed(i) = costX(seed_index(i));
end

% remove the niche less than five individuals and merge them into the nearest niche
[~, index] = sort(cat(2, niches.num));
niches = niches(index);
seed_len=length(niches);
seed_x = x(cat(2, niches.seed), :);
seed_dis=zeros(1,seed_len);
flag=zeros(1,seed_len);
for i=1:seed_len
    if niches(i).num>=5
        continue;
    end
    flag(i)=1;
    for j=1:seed_len
        seed_dis(j)=norm(seed_x(i),seed_x(j));
    end
    seed_dis(i)=inf;
    [~,idx]=min(seed_dis);
    niches(idx).idx =[niches(idx).idx;niches(i).idx];
    niches(idx).num = length(niches(idx).idx);
    niches(idx).subcost = costX(niches(idx).idx); 
    [cost,bestidx]=max(niches(idx).subcost);
    niches(idx).cost=cost;
    niches(idx).seed=niches(idx).idx(bestidx);
end
niches(flag == 1) = [];    
        
    
% get the niche centers' fitness of niches and update bestfitֵ
sub_nums = size(niches,2);
seed = zeros(1,sub_nums);
for i = 1 : sub_nums
    seed(i) = niches(i).seed;
    if costX(seed(i))>bestfit
        bestfit=costX(seed(i));
    end
end

%% IMM
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