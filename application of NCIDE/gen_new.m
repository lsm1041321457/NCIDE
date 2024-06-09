function [pop,fit,FEs] = gen_new( pop,fit,FEs,func,lb,ub,dim,NP)
popsize=size(pop,1);
newnum=NP-popsize;
newpop=rand(newnum,dim).*repmat(ub-lb,newnum,1)+repmat(lb,newnum,1);
newfit=zeros(newnum,1);
for i=1:newfit
    newfit(i)=NES_func(newpop(i,:),func);
end
pop=[pop;newpop];
fit=[fit;newfit];
FEs=FEs+newnum;

