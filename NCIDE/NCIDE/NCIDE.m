function result=NCIDE(func,NP)
MaxFEs=get_maxfes(func);
lb=get_lb(func);
ub=get_ub(func);
dim=get_dimension(func);

archive=[];
archive_fit=[];
bestfit=-inf;
sto=[];
sto_fit=[];
stagList=[];
uCRList=[];
uFList=[];

%% initialize
pop=rand(NP,dim).*repmat(ub-lb,NP,1)+repmat(lb,NP,1);
fit=fast_niching_func(pop,func);
FEs=NP;

while FEs<=MaxFEs
    %% NCI+IMM
     [niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,record,sto,sto_fit,archive,archive_fit,uFList,uCRList]=NCI_IMM(pop,fit,stagList,bestfit,FEs,MaxFEs,sto,sto_fit,archive,archive_fit,uFList,uCRList);

    % crowding+IMM
    % [niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,record,sto,sto_fit,archive,archive_fit,uFList,uCRList]=crowding(pop,fit,stagList,bestfit,dim,sto,sto_fit,archive,archive_fit,uFList,uCRList,lb,ub);
    % speciation+IMM
    % [niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,record,sto,sto_fit,archive,archive_fit,uFList,uCRList]=speciation(pop,fit,stagList,bestfit,sto,sto_fit,archive,archive_fit,uFList,uCRList);
    % NBC+IMM
    % [niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,flag,sto,sto_fit,archive,archive_fit,uFList,uCRList] = NBC(pop,fit,stagList,bestfit,FEs,MaxFEs,dim,sto,sto_fit,archive,archive_fit,uFList,uCRList);
    % NBNC+IMM
    % [niches,stagList,bestfit,niche_erase,pop_erase,sto_erase,record,sto,sto_fit,archive,archive_fit,uFList,uCRList] = NBNC(pop,fit,stagList,bestfit,sto,sto_fit,archive,archive_fit,uFList,uCRList)

    %% NAAPS
    [pop,fit,FEs,uFList,uCRList] = NAAPS(pop,fit,niches,func,FEs,record,uFList,uCRList);
    %% delete stagnant individuals
    if ~isempty(sto_erase)
        sto(sto_erase,:)=[];
        sto_fit(sto_erase)=[];
        stagList(sto_erase)=[];
        uFList(sto_erase)=[];
        uCRList(sto_erase)=[];
    end
    if ~isempty(niche_erase)
        niches(niche_erase)=[];
        archive=[archive;pop(pop_erase,:)];
        archive_fit=[archive_fit;fit(pop_erase)];
        pop(pop_erase,:)=[];
        fit(pop_erase)=[];
    end
    %% generate new individuals to make population size equal NP
    [pop,fit,FEs] = gen_new(pop,fit,FEs,func,lb,ub,dim,NP);
end
result=[pop;archive];