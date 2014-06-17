%% Heun's Method 
% For the system:    y' = ry,   y(0) = 1   over the interval [0,T]
%% True Solution
clear all
N=10; T=1; r=1; % N is # of approximations to make for y(T)
dt=zeros(N,1);
%c=10; % constant interval of increase for dt
%n=zeros(N,1);
for i=1:N
    dt(i)=T/i;
end
y0=1; k=y0; % ytrue(1)=y(0) init. condition
ytrue=k*exp(r*T);
%% Heun's Approximation 
% yheun=zeros(N+1,1); yheun(1)=ytrue(1);
j=1;
errheun=zeros(N+1,1);
errheun(1)=0;
while (j<=N)
    yheun=y0;
    i=2;
    while (i<=N+1)
        k1=r*yheun; k2=r*(yheun+dt(j)*k1);
        yheun=yheun+.5*dt(j)*(k1+k2);
        i=i+1;
    end
    errheun(j+1)=abs(yheun-ytrue);
    j=j+1;
end
%loglog([0:c:dt(N)],errheun,'r*')
%% Euler's Method
%yeuler=zeros(N+1,1); yeuler(1)=ytrue(1); 
erreul=zeros(N+1,1);
erreul(1)=0;
j=1;
while (j<=N)
    yeuler=y0;
    i=2;
    while (i<=N+1)
        yeuler=yeuler+dt(j)*r*yheun;
        i=i+1;
    end
    erreul(j+1)=abs(yeuler-ytrue); 
    j=j+1;
end    
loglog([0;dt],errheun,'r*',[0;dt],erreul,'*'); %hold off
xlabel('dt')
ylabel('error')
legend('Heuns','Eulers')