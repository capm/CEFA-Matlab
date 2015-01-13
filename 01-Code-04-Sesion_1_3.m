%% SESION 1.3
% ESTADÍSTICA

% GENERADOR DE NUMEROS ALEATORIOS

r=binornd(100,0.9); % <--- Un número con distribución binomial.
P=[.1 .4;.3 .9];
r=binornd(100,P); % <--- Una matriz 2x2 con distribución binomial.
nrow=100;
ncol=3;
r=binornd(100,0.9,nrow,ncol); % <--- Una matriz 100x3 con dis. binomial.

y=binopdf(r(:,1),100,0.9);
plot(r(:,1),y,'d');

% DISTRIBUCION NORMAL
mu=0;
sigma=1;
ntimes=100;
nobs=1;
nr=normrnd(mu,sigma,ntimes,nobs);

pdfnr=normpdf(nr,mu,sigma); %Cacula la distribución de probabilidad en nr
plot(nr,pdfnr,'d');

% ESTADISTICA DESCRIPTIVA
clear

x=normrnd(2,6,100,1);

% PROMEDIO
% MEDIANTE CODIGO
T=length(x);
x_sum=0;
for k=1:T
x_sum=x_sum+x(k);
end
x_mean1=x_sum/T;
clear x_sum
% MEDIANTE FUNCION
x_mean2=mean(x);

%x_gmean=geomean(x); % <--- MEDIA GEOMETRICA
x_hmean=harmmean(x); % <--- MEDIA ARMÓNICA
x_median=median(x); % <--- MEDIANA

% DESV. ESTANDAR
% MEDIANTE CODIGO
x2_sum=0;
x2_hat=(x-x_mean1).^2;
for k=1:T
    x2_sum=x2_sum+x2_hat(k);
end
x_stdv1=(x2_sum/(T-1))^(1/2);
clear x2_sum

% MEDIANTE FUNCION
x_stdv2=std(x);

x_var=var(x); % <--- VARIANZA DE x.
x_iqr=iqr(x); % <--- RANGO INTERCUARTILICO.
x_mad=mad(x); % <--- MEAN ABSOLUTE DEVIATION.

