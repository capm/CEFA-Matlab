%% Regresión MCO
% Regresionamos y vs x usando el
% comando "ols(y,x)" y lo guardamos en la estructura "result" como sigue:

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MANIPULACION DE DATOS

%%%%%%%%%%%%%%%%%%%%%%%%%%%

result=ols(y,x);

%%La estructura "result" está compuesta por campos tales como rsqr (R cuadrado),
%%tstat (t-estadístico), beta (coeficientes estimados), entre otros.

result %%Podemos ver el valor de los escalares. Para las matrices, solo podemos ver su dimensión.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Para definir u observar el valor de dichos campos podemos usar los siguientes comandos:

bhat=result.beta; %%Definimos la variable bhat como una matrix que agrupa a los coeficientes estimados.

disp('The R-squared is:');
result.rsqr %%Pantallazo del R cuadrado.

disp('The 2nd t-statistic is:');
result.tstat(2,1) %%%Pantallazo del t-estadístico del segundo coeficiente de la regresión.

result.resid %%En el caso de la matriz "resid", con este comando podemos ver su contenido.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Los siguientes comandos grafican los datos y el ajuste del OLS:

result = ols(y,x);
prt=@prt_reg;
prt(result);
plt(result);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Pantallazo con resultado de las regresiones:

result = ols(y,x);

prt_reg(res); %%El pantallazo no define el nombre de las variables

prt_reg(res,['y variable', 'constant ', 'nombre_de_la_var1 ', 'nombre_de_la_var2 ']); %%Pantallazo con nombre

fid = fopen('ols.out','wr'); %%Guardamos los resultados en un archivo ols.out
fclose(fid); %%Cerramos el archivo ols.out


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Experimento de Monte Carlo
%Usando una misma data simulada para X y 100 diferentes errores epsilon, produciremos 100 vectores Y.
%Con ello, estimaremos 100 regresiones y calcularemos el promedio de los coeficientes estimados.
%La idea es ilustrar la insesgadez del estimador MCO.
%El tamaño muestral tambien será igual a 100.

nobs = 100; nvar = 5; ntrials = 100;
b = ones(nvar,1); % betas verdaderos = 1
x = [ones(nobs,1) randn(nobs,nvar-1); %Matriz fija en todas las muestras
bout = zeros(ntrials,nvar); % Estimadores para cada muestra (100 muestras) de cada variable (5 variables).

for i=1:ntrials;     % Loop para estimar OLS en cada muestra
evec = randn(nobs,1);     % Residuos generados, diferentes en cada loop
y = x*beta + evec;     % Variables dependientes generadas para cada residuo
out = ols(y,x);     % Resultados MCO
bout(i,:) = out.beta';     % Guaradmos las estimaciones en cada fila de bout
end;

bm = mean(bout);
bs = std(bout); % media y desviación estandar del estimador

fprintf(1,'Promedio de los bhats \n');

for i=1:nvar; fprintf(1,'%8.4f \n',bmean(1,i));
end;

fprintf(1,'Std deviation of the bhats \n');
for i=1:nvar; fprintf(1,'%8.4f \n',bstd(1,i));
end;

% Histograma para los estimadores de cada coeficiente
hist(bout);
ylabel('frequency of \beta outcomes');
xlabel('Estimated \beta values');
legend('\beta_1','\beta_2','\beta_3','\beta_4','\beta_5');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Modelo con Correlación Serial
%%Muestra de 200 observaciones, 3 variables independientes y una constante

n = 200;
k = 3;
evec = randn(n,1); % ruido blanco
xmat = [ones(n,1) randn(n,k)]; % variables independientes
y = zeros(n,1);
u = zeros(n,1);
beta = ones(k,1); % coeficiente de variables independientes
beta(1,1) = 10.0; % constante

for i=2:n; % Generamos un modelo con correlación serial de primer orden
u(i,1) = 0.4*u(i-1,1) + evec(i,1); % Error autocorrelacionado
y(i,1) = xmat(i,:)*beta + u(i,1); Generamos variable dependiente
end;

yt = y(101:n,1);
xt = xmat(101:n,:); % Truncamos las variables hasta la observación 100.
n = n-100; % Actualizamos el valor de n
Vnames = strvcat('y','cterm','x2','x3'); % Nombre de las variables
result = ols(yt,xt);
prt(result,Vnames);
plt(result);

%%%%%%%%%%%%%%%%%%%%%
%Cochrane-Orcutt: Estimamos un MCO simple y relacionamos los residuos mediante un proceso autoregresivo.
%Con el coeficiente estimado actualizamos la estimación de beta hasta que la estimación converja.


converg = 1.0;
rho = 0.0; iter = 1;
xl = lag(xt,1);
yl = lag(yt,1);
% Variables rezagadas
xlag = xl(2:n,:);
ylag = yl(2:n,1);

y = yt(2:n,1);
x = xt(2:n,:);
n = n-1;

Vnames = strvcat('ystar','istar','x2star','x3star'); % Nombre de las variables
disp('Cochrane-Orcutt Estimates');

while (converg > 0.0001), % Iteración hasta converger
ystar = y - rho*ylag;
xstar = x - rho*xlag;
res = ols(ystar,xstar); % paso 1: usar rho arbitrario para estimar beta
e = y - x*res.beta; % Encontramos los residuos
elag = lag(e); % residuos rezagados, nos quita una observación
et = e(2:n,1);
elagt = elag(2:n,1);
res_rho = ols(et,elagt);
rho_last = rho;
rho = res_rho.beta(1); % Paso 2, actualizar el estimador de rho
converg = abs(rho - rho_last); % Criterio de convergencia
fprintf(1,'rho = %8.5f, converg = %8.5f, iter = %2d \n',rho,converg,iter);
iter = iter + 1;
end;
%% Estimación final después de la convergencia.
ystar = y - rho*ylag; xstar = x - rho*xlag;
res = ols(ystar,xstar); prt(res,Vnames);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implementación del Test de Wald
% Generamos una muestra de 200 observaciones con 10 potenciales variables explicativas.
% El modelo es creado usando 5 variables explicativas.
% Estimamos el modelo con 10 variables y luego con 5 variables.
% La idea es comparar ambos modelos para ver la significancia conjunta del modelo.

nobs = 200;
nvar = 10;
b = ones(nvar,1);
b(7:nvar,1) = 0.0; % Esta definición de beta hace que el modelo verdadero use solamente las 5 primeras variables y la constante
xmat1 = randn(nobs,nvar-1);
evec = randn(nobs,1)*5;
x = [ones(nobs,1) xmat1]; % Datos completos
y = x*b + evec; % Modelo generado con las 5 primeras variables dependientes y la constante
x2 = x(:,1:5); % 5 primeras variables independientes
resultu = ols(y,x); % MCO con todas las variables
prt(resultu);
resultr = ols(y,x2); % MCO con las variables relevantes
prt(resultr);
% test de significancia conjunta
[fstat fprob] = waldf(resultr,resultu);
disp('Wald F-test results');
[fstat fprob] % Estadístico y p-value
