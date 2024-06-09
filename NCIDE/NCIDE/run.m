function run()
runtime=51;
str='./result';
mkdir(sprintf(str));
for func_num=1:20
%     if func_num<20
%         continue;
%     end
    %% ---------------run
    delete(gcp('nocreate'));
    parpool('local',runtime);
    spmd(runtime)
        result1 = run_NCIDE(func_num,labindex);
        dlmwrite(sprintf('%s/F%d.txt',str, func_num), result1, '-append');
    end
    result = cat(1, result1{1:end});
    pr=mean(result)/get_no_goptima(func_num);
    sr = sum(result == get_no_goptima(func_num))/runtime;
    dlmwrite(sprintf('%s/PR_SR_F%d.txt',str, func_num), pr);
    dlmwrite(sprintf('%s/PR_SR_F%d.txt',str, func_num), sr,'-append');
    %% ---------------debug
%     for run=1:runtime
%         result=run_NCIDE( func_num,[]);
%         dlmwrite(sprintf('%s/F%d.txt',str, func_num), result, '-append');
%     end
    
end
        
