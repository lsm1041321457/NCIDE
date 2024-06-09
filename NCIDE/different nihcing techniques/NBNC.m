function [ niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,record,sto,sto_fit,archive,archive_fit,uFList,uCRList] = NBNC( x,costX,stagList,bestfit,sto,sto_fit,archive,archive_fit,uFList,uCRList)
T=30;
%% NBNC
%The NBNC algorithm is used to formulate species
popsize=size(x,1);
alpha = 5.0;  %  scale factor for species
slbest = zeros(popsize,3);
slbest(:,1) = 1:popsize;

matdis = pdist2(x,x);
%Look for the nearest particle
matdis(logical(eye(popsize))) = inf;
[slbest(:, 3), slbest(:, 2)] = min(matdis, [], 2);

%calculate the meandis
meandis = alpha*mean(slbest(:,3));

% get the minimum distance between the current one and its better neighbor one
%find the better individual within meandis radius
matdis(matdis >= meandis) = inf;
[~, rank] = sort(costX, 'descend');
matdis = matdis(rank, rank);
matdis(triu(true(popsize, popsize))) = inf;
matdis(rank, rank) = matdis;
[slbest(:, 3), slbest(:, 2)] = min(matdis, [], 2);
slbest(slbest(:, 3) == inf,2) = slbest(slbest(:, 3) == inf,1);

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

% Construct the raw species
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

% Sort clusters according to their fitness
%[~,index] = sort(cost_seed);
[~, index] = sort(cat(2, niches.cost));
niches = niches(index);


%seed_x = x(seed_index(index),:);
seed_x = x(cat(2, niches.seed), :);
seed_dis = pdist2(seed_x,seed_x);
seed_dis(logical(eye(seed_len))) = inf;
%Sets the flag of the cluster to be deleted

% the meachism of merging 
mark = zeros(seed_len,2);  % mark all raw species
mark(:,1) = 1:seed_len;
mark(:,2) = mark(:,1);

for i = 1:seed_len
    [~,midx] = min(seed_dis(i,:));
    if niches(i).cost < min(niches(midx).subcost) 
        mark(i,2) = midx;
    end
end

for i = 1 : seed_len 
    j = mark(i,2);
    k = mark(i,1);
    while j~= k 
         k = j;
         j = mark(k,2); 
    end
    mark(i,2) = k;
end
flag = zeros(1,seed_len);
for i = 1:seed_len
    if mark(i,1)~=mark(i,2)
        flag(i) = 1;
        sgbest(niches(i).idx,2) = niches(mark(i,2)).seed;
        niches(mark(i,2)).idx =[niches(i).idx;niches(mark(i,2)).idx];
        niches(mark(i,2)).num = length(niches(mark(i,2)).idx);
        niches(mark(i,2)).subcost = costX(niches(mark(i,2)).idx); 
        [~,seedidx]=max(niches(mark(i,2)).subcost);
        niches(mark(i,2)).seed=niches(mark(i,2)).idx(seedidx);
        niches(mark(i,2)).cost = costX(niches(mark(i,2)).seed);
    end   
end
niches(flag == 1) = [];

%% remove the niche less than five individuals and merge them into the nearest niche
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