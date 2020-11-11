for alpha = [.05 .25]
    if alpha==.05
        ep0 = 1.95996;
    elseif alpha==.25
        ep0 = 1.15034;
    else
        error('no value for this alpha');
    end
    for N=[10 100 1000 10000]
        hits = 0;
        mean_ep = 0;
%         ep = sqrt(1/(2*N)*log(2/alpha))
        for reps=1:10000
            p = .5;
            X = double(rand(N,1) < p);
            Xbar = mean(X);
            sig = std(X);
            ep = sig*ep0/sqrt(N);
            mean_ep = mean_ep + ep/10000;
            if abs(Xbar - p) <= ep
                hits = hits + 1;
            end
         end
    end
end
