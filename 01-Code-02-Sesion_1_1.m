%% SESION 1

% INDICE

% 1.1 HERRAMIENTAS BÁSICAS DE MATLAB
% 1.2 ELEMENTOS BASICOS DE PROGRAMACION
% 1.3 HERRAMIENTAS PARA ANÁLISIS ESTADÍSTICO
% 1.4 HERRAMIENTAS PARA ANÁLISIS ECONOMÉTRICO

%% SECCIÓN 1.1
%HERRAMIENTAS BÁSICAS DE MATLAB

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ELEMENTOS BASICOS DEL ENTORNO MATLAB%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. COMMAND WINDOW
% Esta ventana permite el ingreso de operaciones simples y complejas
% y la visualización de los resultados de los mismos.

% 2. COMMAND HISTORY
% Esta ventana es la bitácora de MATLAB. Consiste en un registro de las
% sentencias que se hayan implementado en sesiones previas y en la actual.
% También se registra la fecha y hora en el momento de iniciar las
% sentencias.

% 3. WORKSPACE
% En esta ventana está compuesta por el conjunto de variables que han sido
% creadas a partir de la ejecución de las sentencias. Asimismo, si un
% comando o función requiere un input previo, esta deberá estar almacenada
% en este espacio.

% 4. CURRENT FOLDER
% Indica el directorio actual sobre el que se está trabajando. Al inicio de
% cada operación la carpeta por defecto es la de Inicio. Sobre esta carpeta
% se grabarán todos los archivos m (m-files) y bases de datos.

% 5. COMANDOS ÚTILES EN MATLAB

% clc       ---> LIMPIA LA VENTADA DE COMANDOS (COMMAND WINDOW)
% clear     ---> LIMPIA EL WORKSPACE
% who(whos) ---> LISTA LAS VARIABLES DEL WORKSPACE
% workspace ---> MUESTRA EL WORKSPACE
% cd        ---> CAMBIA EL DIRECTORIO DE TRABAJO ACTUAL (CURRENT DIRECTORY)
% pwd       ---> MUESTRA LA CARPETA ACTUAL
% ver       ---> MUESTRA INFORMACIÓN ACERCA DE LA VERSIÓN DE MATLAB
                 % INSTALADA
% exit(quit) --> TERMINA LA SESIÓN DE MATLAB
% iskeyword ---> LISTA DE PALABRAS RESERVADAS PARA MATLAB
% !explorer ---> ABRE EL EXPLORADOR
% matlabroot --> MUESTRA LA RUTA RAIZ DE MATLAB
% matlabpath --> MUESTRA TODAS LAS RUTAS DONDE MATLAB BUSCA FUNCIONES
% datafun   ---> LISTA DE FUNCIONES PARA ANALISIS DE DATOS

% 6. COMANDOS ESPECIALES DE MATLAB

% Comandos que retornan resultados muchas veces útiles en los programas de
% MATLAB.

% ans       ---> Retorna el output de alguna sentencia o expresión que no
                 % ha sido asignada a alguna variable.
% eps       ---> Precisión relativa de un dato tipo float.
% intmax    ---> Número entero máximo que la computadora puede representar.
% intmin    ---> Número entero mínimo que la computadora puede representar.
% realmax   ---> Número real máximo que la computadora puede representar.
% realmin   ---> Número real mínimo que la computadora puede representar.
% pi        ---> Número PI (3,14159265....)
% Inf       ---> Infinito (#/0)
% NaN       ---> "Not a Number". (Indeterminación 0/0, Inf/Inf, Inf-Inf,..)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%OPERACIONES BASICAS EN MATLAB%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% CREAR MATRICES

% Para crear una matriz (o arreglo cuadragunlar de numeros, ARRAY)
% podemos proceder de la siguiente manera:

M=[-3 2 1; 0 4 9; 1 7 8; 9 11 -3]; %<--- El operador ";" hace que el coman-
                                   % do o sentencia se ejecute sin mostrar
                                   % el resultado.

% Como se aprecia, las filas han sido separadas unas de otras mediante 
% un punto y coma. En tanto que las columnas dentro de una misma fila
% se separan con un espacio en blanco o comas.
% En este caso se ha creado un arreglo de números de 4 filas y 3 columnas.

% También se pueden crear matrices de una sola fila o columna:

% MATRIZ (VECTOR) FILA
V=[3 4 6 7];

% MATRIZ (VECTOR) COLUMNA
Q=[1; 3; 5; 7];
Q2=[1 3 5 7]'; %% El operador ' indica la transpuesta de una matriz.

clc
% MATRIZ PARTICIONADA

% M es una matriz 3x3. V es una matrix 1x4 y Q una matriz 4x1.
% Entonces se puede crear una matriz D 5x4 combinando estas matrices en una
% sola:

D=[M Q; V];

% MATRIZ DE VALOR COMPLEJO

% Los elementos de una matriz no sólo pueden ser números reales, sino
% también imaginarios. Para ello se debe de utilizar las variables "i" o
% "j", que representan la unidad básica imaginaria (-1)^(1/2).

K=[4+i 2+j; -2.5*j 0.1*j];

% VECTORES RANGO

% Es posible crear vectores fila mediante una progresión artimética.

tt=2008:2012;

tt_2=2004:2:2012;

% OPERACIONES CON MATRICES

% Debe tenerse en cuenta que las expresiones o sentencias en MATLAB son
% evaludadas de izquierda a derecha.

% ADICION

SS=[1 3 4;2 5 -1];
ss=[-2 3 -1;3 5 10];
SM=SS+ss; % <--- Debe recordarse que para que se puedan sumar ambas matrices
          % deben de tener la misma dimensión (filas y columnas).
          
% MULTIPLICACIÓN POR UN ESCALAR

ss_1=-1*ss; % <--- Recordar que al multiplicar un escalar por una matriz,
            % la multiplicación es elemento por elemento.
            
% MULTIPLICACION DE MATRICES 

% ELEMENTO A ELEMENTO

% Este es un operador especial, por medio del cual se pueden multiplicar
% matrices no cuadradas de la misma dimension. El resultado es una matriz
% cuyos elementos es la multiplicacion escalar de cada unos de sus
% elementos.

MM=SS.*ss;

% SEGUN ALGEBRA LINEAL

MM_1=SS*ss'; % <--- Recordar que el # de columnas de la matriz que pre-
             % multiplica tiene que ser igual al # de filas de la matriz
             % que postmultiplica.

% DIVISIÓN DE MATRICES

% ELEMENTO A ELEMENTO

% Al igual que en el caso de la mulplicación, la división se puede realizar
% entre matrices de la misma dimensión. Y el resultado es una matriz del
% mismo tamaño, cuyos elementos son la división escalar de los elementos
% respectivos.

DD_r=SS./ss; % <--- Divide por la derecha.
DD_l=SS.\ss; % <--- Divide por la izquierda.

% SEGÚN ALGEBRA LINEAL

% De acuerdo a las reglas del álgebra lineal, la división de matrices
% consiste en multiplicar por la inversa de la matriz. Para esto, la matriz
% que actúa como divisor debe de ser cuadrada.

DD1=[1 3 4;-2 -3 6];
DD2=[1 5;0 -1; 2 0];
dd=[1 -2 3;0 1 2; 2 0 -7];

QQ_1=DD1/dd; % <--- División por derecha. 'dd' debe de tener el mismo # de
             % columnas que las columnas de DD1
QQ_2=dd\DD2; % <--- División por izquierda. 'dd' debe de tener el mismo # de
             % filas que las filas de DD2.

% POTENCIACIÓN

% COMUN

EE=[1 2 3; 4 5 -2; -1 2 0];

KK=SS^2; % <--- Multiplicar 2 veces seguidas EE.
 de
% ELEMENTO A ELEMENTO

KK_1=SS.^ss; % <--- La base es el elemento de la matriz por la izq.
             % elevada a cada elemento de la matriz de la derecha.

% INDEXACIÓN DE MATRICES

% BIDIMENSIONAL
             
AA=[1 -1 2 3 7 10; 10 -2 1 4 5 -88; 12 21 100 -12 -54 30;...
    0 -1 -2 3 25 67; 21 -12 -1 9 10 -8; 45 67 0 -25 -46 78];

aa=AA(2:3,4:6); % <--- Obtiene los datos de la fila 2 a 3 y de las columnas
                % del 4 al 6.

% INDEXACIÓN LINEAL

aa_1=AA(1:30); % <--- Retorna el valor de la posicion número 30.

% TAMAÑO DE UNA MATRIZ
clear

A=[-3 5 -1 2; 1 -6 2 9; 13 -1 1 31];
B=[4 -5 2 5]';
C=[2 4 1 3];

D=[A' B; C];
E=[[A; C] B];

[m, n]=size(A); % <--- Cuando la función tiene mas de un argumento, es nece-
                % sario poner los resultados a mostrar entre [].

P=[D E'];

p=size(P,1); % <--- Obtiene la dimensión de sus filas.

Q=[P' [C';B]];

q=size(Q,2); % <--- Obtiene la dimensión de sus columnas.

% VALOR MAXIMO DE UNA MATRIZ

maxQ=max(Q); % <--- Devuleve un vector con los valores maximos por columna.
[maxQ, maxInd]=max(Q); % <--- Devuelve, ademàs, la posición del valor máximo.

[minQ, minInd]=min(Q); % <--- Similar al anterior, solo que devuelve el valor 
                      % mínimo.
                      
% OPERACIONES ELEMENTALES

SQ=sum(Q); % <--- suma de elementos columna por columna.

PQ=prod(Q); % <--- producto de elementos columna por columna.

mQ=mean(Q); % <--- promedio por columna.

vQ=var(Q); % <--- varianza por columna.

sQ=std(Q); % <--- Desv. Est. por columna.

S=sort(Q,'ascend'); % <--- Devuelve una matriz cuyos elementos de cada co-
                    % lumna son los elementos ordenados ascendentemente de
                    % Q.

T=sort(Q,'descend');% <--- Devuelve una matriz cuyos elementos de cada co-
                    % lumna son los elementos ordenados descendentemente de
                    % Q.

[S, posS]=sort(Q,'ascend'); %<--- Devuelve, además, la posición donde se en-
                            % contraban los elementos.
             
% RESOLVIENDO UN SISTEMA DE ECUACIONES

% Sea el sistema:
% 3x_1+4x_2+x_3+5x_4=2
% 2x_1+x_2+9x_3+2x_4=1
% x_1+2x_2+x_3+x_4  =-2
%          x_2-x_4  =3

% Este sistema se puede reducir a la siguiente forma: A*x=B

% A y B pueden ser representados como:
clear
A=[3 4 1 5; 2 1 9 2; 1 2 1 1; 0 1 0 -1]; % <--- Matriz de coeficientes.
B=[2 1 -2 3]; % <--- Matriz de constantes.

% Antes snalizaremos si el sistema tiene solución única:
% De la teoría de álgebra lineal se sabe que un sistema tiene solución
% única si las ecuaciones que conforman el sistema no son redundantes. es
% decir, si la matriz A es no singular.

% Ello se puede saber si obtenemos su rango, su determinante, sus valores
% propios o si la inversa existe.

ranA=rank(A); % <--- Rango de A.
detA=det(A); % <--- determinante de A.
[EigvcA,EigvaA]=eig(A); % <--- Valores propios de A.
liA=rref(A); % <--- Indica si las columnas son linealmente independientes.
invA=inv(A); % <--- Matriz Inversa de A.

% Como se puede apreciar, la matriz A es no singular. Por tanto se puede
% hallar la solución al problema: x=B*A^-1

x=B/A; % <--- Solución del del sistema de ecuaciones.

% MANIPULACION DE MATRICES

clear

A= magic(7); % <--- Matrix mágica de orden 7

P=A(2:5;1:4); % <--- Submatriz que contiene los elemantos de A des la fila 2
              % a la 5 y la columna 1 a la 4.
              
Q=A(1:7;5:7); % <--- las ultimas tres columnas de A.
Q=A(:;5:7); % <--- Igual que el anterior.

R=A(1:3;:); % <--- Las primeras tres filas de A.

% Intercambiar la fila 1 y 4 de A.

B=A([4 2 3 1 5 6 7],:);

% Incrementar la fila 4 de B en 5 veces la fila 7

B(4,:)=B(4,:)+5*B(7,:);

% Cambiar las columnas 3 y 6 de A por las filas 2 y 4 de B.
A(:,[3,6])=B([2,4],:)';

% Eliminar la fila 3 y la columna 5 de B.
B(3,:)=[];
B(:,5)=[];

% Listar los elementos de la matriz A como un único vector columna.

vecA=A(:);

% Listar en un único vector columna los elementos de B que no excedan la
% media de los elementos de B.

D=B(B<mean(B(:)));



             
