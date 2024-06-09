function x1=limit(x1,dim,lb,ub)
for i=1:dim
    if x1(i)<lb(i)
        x1(i)=lb(i);
    end
    if x1(i)>ub(i)
        x1(i)=ub(i);
    end
end