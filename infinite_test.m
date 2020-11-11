theta = 0.7;
true_mean = theta;
n_sample = 50000;
N = 10000;
% fileID = fopen('bernoulli_log.txt','w+');
for i = [10,]
%     fprintf(fileID,"Function %d 's log\n",i);
    fprintf("function %d",i);
    hits = 0;
    mean_ep = 0;
    for reps = 1:n_sample
        X = sample_bernoulli(N,theta);
        Xbar = mean(X);
        [A,B] = ci(X,i);
        ep = (B-A)/2;
        mean_ep = mean_ep + ep/n_sample;
        if abs(Xbar-true_mean)<ep
            hits = hits + 1;
        end
    end
    miss_rate = 1 - hits/n_sample;
    fprintf("N:%d ep:%.4f frac_missed:%.5f\n",N,mean_ep,miss_rate);

end