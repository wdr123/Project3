theta = 0.7;
true_mean = theta;
n_sample = 10000;
miss_set = zeros(10,1,4);
ep_set = zeros(10,1,4);
for i = 1:10
    j = 0;
%     fprintf(fileID,"Function %d 's log\n",i);
    for N = [10 100 1000 10000]
        j = j+1;
        hits = 0;
        mean_ep = 0;
        for reps = 1:n_sample
            X = sample_bernoulli(N,theta);
            [A,B] = ci(X,i);
            ep = (B-A)/2;
            mean_ep = mean_ep + ep/n_sample;
            if A<=true_mean && true_mean<=B
                hits = hits + 1;
            end
        end
        miss_rate = 1 - hits/n_sample;
        miss_set(i,1,j) = miss_rate;
        ep_set(i,1,j) = mean_ep;
%         fprintf(fileID,"N:%d ep:%.4f frac_missed:%.5f\n",N,mean_ep,miss_rate);
    end
%     fprintf(fileID,"\n");
end
fileID = fopen('bernoulli_log.txt','w+');
index = [10, 100, 1000, 10000];
for i = 1:10
    total = [index;reshape(ep_set(i,:,:),1,4);reshape(miss_set(i,:,:),1,4)];
    fprintf(fileID,"Function %d 's log\n",i);
    fprintf(fileID,"N:%d ep:%.4f frac_missed:%.5f\n",total);
end
fclose(fileID);