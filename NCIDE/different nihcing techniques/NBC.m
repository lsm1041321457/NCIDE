function [ niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,flag,sto,sto_fit,archive,archive_fit,uFList,uCRList] = NBC( x,costX,stagList,bestfit,FEs,MaxFEs,dim,sto,sto_fit,archive,archive_fit,uFList,uCRList)
T=30;

NP=size(x,1);
fai=2.0;
matdis=pdist2(x,x);
matdis(logical(eye(NP))) = inf;
D=dim;
min_size = min(5+(FEs/MaxFEs)/2, max(10, 3*D));
% find the nearest better neighour and the distance of each individual
NP = size(matdis, 1);
nbc = zeros(NP, 3);
nbc(1, :) = [1 -1 0]; % the best individual do not have the nearest better neighbour
for i = 2:NP
    nbc(i, 1) = i;
    [nbc(i, 3), nbc(i, 2)] = min(matdis(i, 1:i-1));
end

% set the follow value
follow = ones(NP, 1);
for i = NP:-1:2
    follow(nbc(i, 2)) = follow(nbc(i, 2)) + follow(i); % the subtree rooted at nearest better neighbour individual must contain all current individual's nodes
end

% cut the edge from the longest to the shortest
meandis = fai * mean(nbc(2:NP, 3));
seeds = 1;

[~, sort_index] = sort(nbc(:, 3), 'descend');
for i = 1:NP
    if nbc(sort_index(i), 3) > meandis % one of the cut conditions
        inf_index = sort_index(i); % the inferior individual
        sup_index = nbc(sort_index(i), 2); % the superior individual
        top_index = sup_index; % the root of the subtree which contains the inferior and superior individuals
        while nbc(top_index, 2) ~= -1
            top_index = nbc(top_index, 2);
            sup_index = [sup_index, top_index];
        end

        if follow(inf_index) >= min_size && follow(top_index) - follow(inf_index) >= min_size % the other of the cut conditions
            % cut operator
            nbc(inf_index, 2) = -1;
            nbc(inf_index, 3) = 0;
            % put the current seed into the set
            seeds = [seeds; sort_index(i)];
            follow(sup_index) = follow(sup_index) - follow(inf_index);
        end
    end
end

% set the root of subtree which contain the current individual
m = zeros(NP, 2);
m(1:NP, 1) = 1:NP;
for i = 1:NP
    j = nbc(i, 2);
    k = j;
    while j ~= -1
        k =j;
        j = nbc(j, 2);
    end
    if k == -1
        m(i, 2) = i;
    else
        m(i, 2) = k;
    end
end

% construct the result
niches = struct();
for i=1:length(seeds)
    niches(i).seed = seeds(i);
    niches(i).idx = m(m(:, 2) == seeds(i), 1);
    niches(i).num = length(niches(i).idx);
    niches(i).subcost=costX(niches(i).idx);
    [~,seedidx]=max(niches(i).subcost);
    niches(i).seed=niches(i).idx(seedidx);
    niches(i).cost = costX(niches(i).seed);
end

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