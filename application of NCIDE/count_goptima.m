function [count] = count_goptima(result,func)
[~,~,~,~,~,solution_num,root,~] = NES_Parameter(func);
tc=zeros(1,solution_num);
[NP,dim]=size(result);
if(dim <= 5)
    epsilon = 0.000001;
else
    epsilon = 0.0001;
end
fit=zeros(1,size(NP,1));
for i=1:NP
    fit(i)=NES_func(result(i,:),func);
end
for i=1:NP
    if(fit(i)<=epsilon)
        for j=1:solution_num
            if norm(result(i,:)-root(j,:))<=0.5
                tc(j)=1;
            end
        end
    end
end
count=length(find(tc==1));