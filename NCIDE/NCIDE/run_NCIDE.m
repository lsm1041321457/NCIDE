function [count] = run_NCIDE( func,runidx)
global initial_flag;
%set random seed
AlgRand = RandStream('mt19937ar','Seed','shuffle'); 
RandStream.setGlobalStream(AlgRand);
initial_flag = 0;
acc=[1e-1,1e-2,1e-3,1e-4,1e-5];
count=zeros(1,5);
popsize=get_NP(func);
result=NCIDE(func,popsize);
for i=1:5
    [counti,seed]=count_goptima(result,func,acc(i));
    count(i)=counti;
    if i==4
        draw_seed=seed;
    end
end
% draw_landscape(draw_seed,func);
end

