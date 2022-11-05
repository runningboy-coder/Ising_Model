function energy = calcEnergy(state)
energy = 0;
[M,N]  = size(state);
for i = 2:M-1
    for j = 2:N-1
        S = state(i,j);
        nb = state(i+1,j)+ state(i-1,j)...
                +state(i,j+1)+ state(i,j-1);
        energy = energy -nb*S;
    end
end
end

            