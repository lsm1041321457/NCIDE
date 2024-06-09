function [pop,fit,FEs] = gen_new( pop,fit,FEs,func,lb,ub,dim,NP)
popsize=size(pop,1);
newnum=NP-popsize;
newpop=rand(newnum,dim).*repmat(ub-lb,newnum,1)+repmat(lb,newnum,1);
newfit=fast_niching_func(newpop,func);
pop=[pop;newpop];
fit=[fit;newfit];
FEs=FEs+newnum;

