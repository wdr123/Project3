true_mean = 0.5;
n_sample = 10000;
fileID = fopen('uniform_log.txt','w+');
for i = 1:10
    fprintf(fileID,"Function %d 's log\n",i);
    for N = [5 10 100 1000 10000 100000]
        hits = 0;
        mean_ep = 0;
        for reps = 1:n_sample
            X = sample_uniform(N,0,1);
            Xbar = mean(X);
            [A,B] = ci(X,i);
            ep = (B-A)/2;
            mean_ep = mean_ep + ep/n_sample;
            if abs(Xbar-true_mean)<ep
                hits = hits + 1;
            end
        end
        miss_rate = 1 - hits/n_sample;
        fprintf(fileID,"N:%d ep:%.4f frac_missed:%.5f\n",N,mean_ep,miss_rate);
    end
    fprintf(fileID,"\n");
end
fclose(fileID);