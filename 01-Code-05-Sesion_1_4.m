%% Regresión MCO
% Regresionamos y vs x usando el
% comando "ols(y,x)" y lo guardamos en la estructura "result" como sigue:

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MANIPULACION DE DATOS
pen=xlsread('C:\Users\bcr_user\Downloads\Data_Currencies.xlsx','DATA','B2:B2075');
cop=xlsread('C:\Users\bcr_user\Downloads\Data_Currencies.xlsx','DATA','C2:C2075');
clp=xlsread('C:\Users\bcr_user\Downloads\Data_Currencies.xlsx','DATA','D2:D2075');
mex=xlsread('C:\Users\bcr_user\Downloads\Data_Currencies.xlsx','DATA','E2:E2075');
real=xlsread('C:\Users\bcr_user\Downloads\Data_Currencies.xlsx','DATA','F2:F2075');
rfree=xlsread('C:\Users\bcr_user\Downloads\Data_Currencies.xlsx','DATA','G2:G2075');

apr_pen=zeros(2072,1);
for i=1:2071;
    apr_pen(i)=pen(i)/pen(i+1)*100-100;
end;

apr_cop=zeros(2072,1);
for i=1:2071;
    apr_cop(i)=cop(i)/cop(i+1)*100-100;
end;

apr_clp=zeros(2072,1);
for i=1:2071;
    apr_clp(i)=clp(i)/clp(i+1)*100-100;
end;
apr_mex=zeros(2072,1);
for i=1:2071;
    apr_mex(i)=mex(i)/mex(i+1)*100-100;
end;

mean_apr=zeros(2072,1);
for i=1:2072;
    mean_apr(i,1)=(apr_pen(i,1)+apr_cop(i,1)+apr_clp(i,1)+apr_mex(i,1))/4;
end;

rfree=rfree(2:2073);
ex_ret=mean_apr-rfree;
x=ones(2072,1);
regresor=[x ex_ret];
[b, bint, r, rint, stats]=regress(apr_mex, regresor);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
b=regress(y,x);
[b,bint]=regress(y,x);
[b,bint,r]=regress(y,x);
[b,bint,r,rint,stats]=regress(y,x);

scatter(ex_ret,apr_mex,'filled');
hold on;
apr_mex_fit=b(1)*x+b(2)*ex_ret;
plot(ex_ret,apr_mex_fit);
