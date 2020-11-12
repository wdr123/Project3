for alpha = [.3 .25]
    for N=[10 100 1000 10000]
        hits = 0;
        ep = sqrt(1/(2*N)*log(2/alpha));
        for reps=1:10000
            X = double(rand(N,1)<0.5);
%             X = sample_normal(N,1,0);
            Xbar = mean(X);
            if abs(Xbar-0.5) <= ep
                hits = hits + 1;
            end
        end
        fprintf('alpha: %1.3f N: %5d ep: %1.3f frac missed: %1.3f\n',alpha, N, ep, 1-hits/10000);
    end
end