function [pop,fit,FEs]=global_DE(pop,fit,dim,func,lb,ub,FEs)
popsize=size(pop,1);
F=0.5;
CR=0.9;
for i=1:popsize
    if rand()<0.5 %Ö´ÐÐDE/rand/1
        %mutate
        r=randperm(popsize,3);
        V=pop(r(1),:)+F*(pop(r(2),:)-pop(r(3),:));
    else %Ö´ÐÐDE/rand/2
        r=randperm(popsize,5);
        V=pop(r(1),:)+F*(pop(r(2),:)-pop(r(3),:))+F*(pop(r(4),:)-pop(r(5),:));
    end
    V=limit(V,dim,lb,ub);
    %crossover
    U=zeros(1,dim);
    randj=randi(dim);
    for k = 1:dim
        if k == randj || rand() <=CR
            U(k) = V(k);
        else
            U(k) = pop(i,k);
        end
    end
    U_fit=fast_niching_func(U,func);
    FEs=FEs+1;
    %nearest_select
    dis=zeros(1,popsize);
    for j=1:popsize
        dis(j)=norm(pop(j,:)-U);
    end
    [~,disidx]=min(dis);
    if U_fit>fit(disidx)
        pop(disidx,:)=U;
        fit(disidx)=U_fit;
    end
    %normal_select
%     if U_fit>fit(i)
%         pop(i,:)=U;
%         fit(i)=U_fit;
%     end
end

   
