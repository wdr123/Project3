comp = zeros(10,2);
for reps = 1:100
    X = sample_uniform(10000,0,1);
    [comp(reps,1),comp(reps,2)] = ci(X,10);
end
