function [pop,fit,FEs,uFList,uCRList] = NAAPS(pop,fit,niches,func,FEs,record,uFList,uCRList)
niches_num=length(niches);
[~,~,dim,lb,ub,~,~,~] = NES_Parameter(func);
c=0.1;
for i=1:niches_num
    [niches(i).subcost,idx]=sort(niches(i).subcost,'descend');
    niches(i).idx=niches(i).idx(idx);
    uCRi=uCRList(record(i));
    uFi=uFList(record(i));
    SF=[];
    SCR=[];
    for j=1:niches(i).num
        CR=normrnd(uCRi,0.1);
        CR = min(1, max(0, CR));
        F=normCauchy(uFi,0.1);
        while F<0
            F=normCauchy(uFi,0.1);
        end
        F = min(1, F);
        % Mutation
        r=zeros(1,2);
        r(1)=j;
        while r(1)==j||r(2)==j
            r=randperm(niches(i).num,2);
        end
        bestidx=niches(i).seed;
        self=niches(i).idx(j);
        r1=niches(i).idx(r(1));
        r2=niches(i).idx(r(2));
        V=pop(self,:)+F*(pop(bestidx,:)-pop(self,:))+F*(pop(r1,:)-pop(r2,:));
        V=limit(V,dim,lb,ub);
        % Crossover
        U=zeros(1,dim);
        randj=randi(dim);
        for k = 1:dim
            if k == randj || rand() <=CR
                U(k) = V(k);
            else
                U(k) = pop(niches(i).idx(j),k);
            end
        end
        % Selection
        U_fit=NES_func(U,func);
        FEs=FEs+1;
        if(U_fit>=niches(i).subcost(j))
            pop(niches(i).idx(j),:)=U;
            niches(i).subcost(j)=U_fit;
            fit(niches(i).idx(j))=U_fit;
            SCR=[SCR;CR];
            SF=[SF;F];
        end
    end
    if ~isempty(SCR)&&sum(SF)>0
        uCRi=(1-c)*uCRi+c*mean(SCR);
        meanL=sum(SF.*SF)/sum(SF);
        uFi=(1-c)*uFi+c*meanL;
        uCR(record(i))=uCRi;
        uF(record(i))=uFi;
    end
end

function F=normCauchy(u,sigma)
F=u + sigma * tan(pi * (rand() - 0.5));
