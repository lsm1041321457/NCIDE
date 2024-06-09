function [count] = run_NCIDE( func,runidx)
global initial_flag;
AlgRand = RandStream('mt19937ar','Seed','shuffle'); %set random seed
RandStream.setGlobalStream(AlgRand);
initial_flag = 0;
popsize=get_NP(func);
result=NCIDE(func,popsize);
count=count_goptima(result,func);
end

