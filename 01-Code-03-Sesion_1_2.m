%% SESION 1.2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ELEMENTOS BÁSICOS DE PROGRAMACION%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Un programa es un conjunto de instrucciones que el computador ejecuta,
% las cuales han sido escritas en un lenguaje de programación.

% Un algoritmo es una secuencia de etapas no ambigua, ordenada y finita que
% lleva a la solución de un determinado problema.

% La programación es la realización de dicho algoritmo en un programa,
% mediante un determinado lenguaje.

% Fuente: "Matlab para Ingeniería". Miguel Ataurima, Julio 2013.

% En MATLAB, la programación de algoritmos (simples o complejos) se
% desarrolla en los archivos M (m-files), que son archivos de texto que
% contienen las sentencias de un algoritmo(s) específico(s).

clear

% edit <--- Para iniciar el editor

% Existen dos tipos de m-file:

% 1. Script: 
% Que contiene sentencias de MATLAB, pero que en su invocación o ejecución
% no recibe ni retorna argumentos.

% 2. Función:
% A diferencia del script, si recibe y retorna argumentos.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%COMANDOS UTILES DE PROGRAMACIÓN%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% INPUT: Permite el ingreso de entradas del usuario

inpt1=input('2');
inpt2=input('Hola','s'); % <--- La opción indica "string".

% En ambos casos, el comando requiere la introducción de una entrada del
% usuario. En el primero, debe de ser númerica. Para el segundo, un texto.

inpt3=input('Hola \nMundo','s'); % <--- '\n' indicada una nueva lìnea.

% DISPLAY: Permite visualizar un texto o un arreglo numérico.

% Cuando se le usa con elementos númericos, es como una calculadora.

disp(8+7*3)

% FPRINTF: Permite escribir datos con formato en la pantalla.

% Permite controlar la notación, alineación, número de digitos, ancho del
% campo y otros aspectos del formato de salida.

% Se puede incluir caracteres especiales como: \n (nueva línea; \t
% tabulación.

% Para el caso de conversión, estos especifiacoderes son de la siguiente
% forma: %-12.7f

% Donde: '-' indicada alineación a la izquierda; '12' es el número de
% espacios incluidos el punto decimal; '7' la precisión (número de digitos
% luego del punto decimal); 'f' es el tipo de dato asociado al valor por
% imprimir (en este caso, punto fijo).

% MANIPULADOR DE FUNCIONES (@)

% podemos asignarle a una variable una función determinada y volver a
% emplearla sin tener que hacer invocación a la función original.

f1=@sin; % <--- Asignando a la variable f1 la función seno.
y=f1(pi/2); % <--- Hallando el valor del seno de pi/2.

% FUNCIONES ANONIMAS

% f_1(x,y)=x*exp^-(x^2+y^2)
% f_2(x,y,z)=f_1(x,y)*(z+2)^(1/2)

f1=@(x,y) x.*exp(-x.^2-y.^2);
f1(2,1);
f2=@(x,y,z) f1(x,y)*sqrt(z+2);
f2(2,1,7);

%% IMPLEMENTACION DE ALGORITMOS  NÚMERICOS

% SENTENCIAS DE CONTROL SELECTIVAS

% Se evalúa una condición, de acuerdo a si se se cumple o no, se ejecuta un
% grupo de sentencias. La condición a evaluarse es una condición lógica.

% Estos tipos de controles selectivos (condiciones) pueden ser simples, de
% dos vías, de una sola, multiples, por comparación.

% if condición ... sentencia(s) ... else ... sentencia(s) ... end;
% if condición ... sentencia(s) ... end
% if condición ... ; ... else ... sentencia(s) ... end
% if cond_1 ... sent_1 ... elseif cond_2 ... sent_2 ... elsesif con_N
% ... sent_N ... else sent_default ... end

% switch var ... case cte_1 ... sent_1 ... case cte_N ... sent_N ...
% otherwise ... sent_default ... end

% SENTENCIAS DE CONTROL ITERATIVA

% De dos tipos: (i) Por evaluación de condición; (ii) Por recorrido de
% rango.

% (i)

% Se evalua una condición lógica, de resultar verdadera se ejecutan un
% grupo de sentencias. El proceso se detiene cuando la condición resulte
% falsa.

% while condición ... sentencia(s) .... end

% (ii)

% Se crea una variable de conteo (contador) que toma unos valores. las
% sentencias se ejecutan para cada valor admisible del contador.

% for rango(k) ... sentencia(s) ... end

% A estos dos tipos de procesos iterativos, se les conoce comúnmente como
% bucles.

% SENTENCIAS ESPECIALES

% DE SALTO: (i) continue; (ii) break; (iii) return

% (i)
% Pasa el control a la siguiente iteración en los bucles (while, for) en lo
% que aparecen, dejando sin evaluación (salteando) las sentencias que la
% sucedan.

% for rango(k)
% sentencia(s)_1
%   if condición <--- si la condición es verdadera se ejecuta 'continue'
%       sentencia(s)_2
%       continue;  <--- al ejecutarse, se incia una nueva iteración,
%                       ignorando el grupo de setencias que siguen.
%   end
%   sentencia(s)_3 
%end

% (ii)
% Termina la ejecución de la bucle. Las sentencias que aparezcan luego no
% se ejecutan.

% for rango(k)
% sentencia(s)_1
%   if condición <--- si la condición es verdadera se ejecuta 'break'
%       sentencia(s)_2
%       break;  <--- al ejecutarse, se finaliza la ejecución de la bucle.
%   end
%   sentencia(s)_3 
%end

% (iii)
% Ocasiona un retorno normal a la función invocante.

% function d=det(A)
%
% if isempty(A)
%    d=1;
%    return
% else
% ...
% ...
% end


% APLICACIONES

% SOLUCION DE ECUACIONES NO LINEALES:

%METODO DE PUNTO FIJO
% x=g(x)
% Aproxima la solución de la ecuación anterior, iniciando con un valor
% inicial (p_1) y la fórmula de recurrencia p_n=g(p_(n-1)).

% Algoritmo:

function [p,k,P,err]=puntofijo(strg,p1,tol,max1)
% Entrada:
% strg: Función Iterativa, en forma de cadena de valores.
% p_1: valor inicial
% tol: tolerancia
% max1: máximo número de iteraciones.

% Salida:
% p: aproximación resultante.
% k: número de iteraciones efectuadas.
% P: vector que contiene la secuencia de aproximaciones.
% err: error de la aproximación.

P(1)=p1;
for k=2:max1
    P(k)=feval(strg,P(k-1));
    err=abs(P(k)-P(k-1));
    relerr=err/(P(k)+eps);
    if (err < tol | relerr < tol)
        break;
    end
end

if k==max1
    disp('Número máximo de iteraciones excedido');
end

P=P(:);
p=P(end);




