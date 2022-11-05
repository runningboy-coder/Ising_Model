%%This progrom aim to simulate 2D Ising Model using MC method
%% Author: Ma Xuelong 
%%Student ID:1120190274
%%Class: 18111901

clear;     
nt = 60; %number of temperture points
L = 100; %size of the lattice, L*L
T = linspace(0,5,nt); %tempature points from 0K~5K
E = zeros(1,nt);         %Energy
M = E;                      % Mafnetization
C =E;                        %
X = E;
McSteps = 10;        %number of MC 
%initial state : assmuing all state are 1,i.e. spin up
state = ones(L,L);   
N = 10;  % number of MC sweeps for calculation
n1 = 1.0/(McSteps*L*L);
n2 = 1.0/(McSteps*McSteps*L*L);
for t=1:nt
    E1 = 0; M1 = 0; E2 = 0; M2 = 0;
    iT = 1.0/T(t);
    iT2 = iT*iT;
    
    %equilbrate at T = iT
    
    %calculate the energy
    for i = 1:McSteps
        state = mcmovem(state,iT);
        Ene = calcEnergy(state);
        Mag = calcMag(state);
    
        E1 = E1 + Ene;
        M1 = M1 + Mag;
        M2 = M2 + Mag*Mag;
        E2 = E2 + Ene*Ene;
    end
    
    E(t) = n1*E1;
    M(t) = n1*M1;
    C(t) = (n1*E2 - n2*E1*E1)*iT2;
    X(t) = (n1*M2 - n2*M1*M1)*iT;
end

figure(1)
scatter(T,E);
xlabel('Temperature (T)');
ylabel("Energy");

figure(2);
scatter(T,abs(M));
xlabel('Temperature (T)');
ylabel("Mafnetization");
axis tight

figure(3)
scatter(T,C);
xlabel('Temperature (T)');
ylabel("Specific Heat");
axis tight;

figure(4)
scatter(T,X);
xlabel('Temperature (T)');
ylabel("Susceptiblity");
axis tight;




    
            