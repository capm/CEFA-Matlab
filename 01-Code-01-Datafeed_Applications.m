%% DATA FEED TOOLBOX

% YAHOO FUNCTIONS

%%%%%%%%%%%%%%
%%%COMANDOS%%%
%%%%%%%%%%%%%%

% YAHOO
% Verifica que la  URL ' http://download.finance.yahoo.com' este accesible
% y crea un manipulador de conección, es decir asigna a un nombre
% especificado por el usuario la URL.

conectar = yahoo

% FETCH function

% Buscador de Securities (LOOKUP)
% Empleamos el comando fectch y el argumento 'LOOKUP' para encontrar un
% ticker (nombre) de algún security.

bdata=fetch(conectar, 'Peru', 'LOOKUP', 'Govt');

% Listado de Mercados para Securities:
% Comdty    : Commodities
% Corp      : Corporate Bons
% Curncy    : Currencies
% Equity    : Equities
% Govt      : Government Bonds
% Index     : Indexes
% M-Mkt     : Money Market
% Mtge      : Mortage-backed securities
% Muni      : Municipal Bonds
% Pfd       : Preferred Stocks

% Precio y Volumen
% Se puede obtener el precio y volumen  para un security específico a una fecha específica

tsdata=fetch(conectar, 'IBM US Equity', '11/16/99')

% Data histórica

hdata=fetch(conectar, 'IBM US Equity', 'LastPrice', '07/15/1999', '08/02/2002');


