%% MODELOS AUTOREGRESIVOS

clear
clc

% SIMULACION DE PROCESOS AR(1)

phi=[0.5 0.7 0.9 0.95 1];
n=size(phi,2);

epsilon=normrnd(0,1,101,1);
T=size(epsilon,1);

Y=zeros(T,n);

% CONSTRUYENDO LAS SERIES
for k=1:n
    for t=2:T
        Y(t,k)=phi(1,k)*Y(t-1,k)+epsilon(t,1);
    end
end

H=line([1:100]',Y(2:101,:));

a=get(H);
set(H(1),'DisplayName','phi=0.5');
set(H(2),'DisplayName','phi=0.7');
set(H(3),'DisplayName','phi=0.9');
set(H(4),'DisplayName','phi=0.95');
set(H(5),'DisplayName','phi=1');
legend('show');

% DENSIDAD DEL PARAMETRO DE PERSISTENCIA DE UN AR(1) 

clear
clc

phi=1;
T=101;
ro=zeros(T-1,1);
tstats=zeros(T-1,1);

for r=1:T-1
y_t=zeros(T,1);
y_t_lag=zeros(T,1);
y_t_lag(y_t_lag(:)<=0)=NaN;
for t=1:T-1
%CREANDO PROCESO AR(1) y REZAGO    
epsilon=normrnd(0,1,T,1);
y_t(t+1,1)=phi*y_t(t,1)+epsilon(t+1,1);
y_t_lag(t+1,1)=y_t(t);
end
%ESTIMANDO
[b_t,~,~,~,stats]=regress(y_t(2:101,:),y_t_lag(2:101,:));
ro(r)=b_t(1,1);
%CREANDO T-ESTADISTICOS PARA PRUEBA DE phi=1
tstats(r)=(ro(r)-1)/sqrt(((y_t_lag(2:101,:)'*y_t_lag(2:101,:))^(-1))*stats(1,4));
end

[f_ts,tsi]=ksdensity(tstats);
norm_i=pdf('Normal',tsi,0,1);
figure()
plot(tsi,f_ts), hold on
plot(tsi,norm_i)

% PROBLEMAS DE POTENCIA DEL TEST ADF

clear
clc

clear
clc

phi=0.95;
T=101;
rejects=zeros(T-1,1);

for r=1:T-1
y_t=zeros(T,1);
for t=1:T-1
%CREANDO PROCESO AR(1) y REZAGO    
epsilon=normrnd(0,1,T,1);
y_t(t+1,1)=phi*y_t(t,1)+epsilon(t+1,1);
end
%TEST ADF
yts=timeseries(y_t(2:101),1:100,'name','AR(1)');
h=adftest(yts);
rejects(r)=h;
end

power=(1-(sum(rejects(:))/size(rejects)))*100;
