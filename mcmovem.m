function config = mcmove(state,beta)
    %%Monte carlo move using Metropolis algorithm
    config = state;
    [M,N] = size(state);
    for i = 1:M
        for j = 1:N
            a = randi(N-1);
            b = randi(M-1); % randomly pick a site
            if a==1
                a = 2;
            end
       
            if b==1
                b=2;
            end
            s = config(a,b);
            nb = config(a+1,b)+ config(a-1,b)...
                +config(a,b+1)+ config(a,b-1);
            cost = 2*s*nb;
            
            if cost < 0
                s = s*(-1) ;
            else if rand < exp(-cost*beta)
                    s = s*(-1)  %state change
            config(a,b) = s;
                end
            end
        end
    end
end