function run()
runtime=100;
str='./result_test';
mkdir(sprintf(str));
for func_num=1:30
     if func_num~=28
         continue;
     end
    [~,~,~,~,~,solution_num,~,~] = NES_Parameter(func_num);
    %% ---------------run
    delete(gcp('nocreate'));
    parpool('local',runtime);

    spmd(runtime)
        result1 = run_NCIDE(func_num,labindex);
        dlmwrite(sprintf('%s/F%d.txt',str, func_num), result1, '-append');
    end
    result = cat(1, result1{1:end});
    pr=mean(result)/solution_num;
    sr = sum(result == solution_num)/runtime;
    dlmwrite(sprintf('%s/PR_SR_F%d.txt',str, func_num), pr);
    dlmwrite(sprintf('%s/PR_SR_F%d.txt',str, func_num), sr,'-append');
    %% ---------------debug
%     for run=1:runtime    
%         result = run_myself(func_num, run);
%         pr=mean(result)/solution_num;
%         sr = sum(result == solution_num)/runtime;
%         dlmwrite(sprintf('%s/PR_SR_F%d.txt',str, func_num), pr);
%         dlmwrite(sprintf('%s/PR_SR_F%d.txt',str, func_num), sr,'-append');
%     end
end
        
