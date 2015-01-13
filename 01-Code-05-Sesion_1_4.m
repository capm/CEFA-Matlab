%% Regresión MCO
% Regresionamos y vs x usando el
% comando "ols(y,x)" y lo guardamos en la estructura "result" como sigue:

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MANIPULACION DE DATOS
pen=xlsread('C:\Documents and Settings\Administrador\Escritorio\clase matlab\Data_Currencies.xlsx','DATA','B2:B2075');
cop=xlsread('C:\Documents and Settings\Administrador\Escritorio\clase matlab\Data_Currencies.xlsx','DATA','C2:C2075');
clp=xlsread('C:\Documents and Settings\Administrador\Escritorio\clase matlab\Data_Currencies.xlsx','DATA','D2:D2075');

apr_pen=zeros(2072,1);
for i=1:2071;
    apr_pen(i)=pen(i+1)/pen(i)*100-100;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
b=regress(y,x);
[b,bint]=regress(y,x);
[b,bint,r]=regress(y,x);
[b,bint,r,rint,stats]=regress(y,x);

scatter(cop,clp,'filled');
hold on;
clpfit=b*cop;
plot(cop,clpfit);
