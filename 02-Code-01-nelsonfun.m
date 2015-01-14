function[y] = nelsonfun(x,par)
% NELSONFUN Evaluate Nelson-Siegel function 
% Inputs    x   - n*1 or 1*n vector
%           par - structure with fields 'beta' (3*1 or 1*3 vector), 'tau' (scalar)
% Outputs   y   - n*1 vector
% Example   par.beta = [.05 .1 .5]
%           par.tau  = 1
%           x = [.125 .25 .5 1 2 3 5 7 10 20 30]
%           y = nelsonfun(x,par)
% Author    Dimitri Shvorob, dimitri.shvorob@vanderbilt.edu, 12/30/07

checkfield('beta',3)
checkfield('tau' ,1)
i = x(:)/par.tau;
j = 1-exp(-i);
y = par.beta(1) + par.beta(2)*j./i + par.beta(3)*((j./i)+j-1);

function checkfield(name,n)
if ~isfield(par,name)
   error('Field "%s" not found in parameter structure',name) 
else
   if ~isvector(par.(name)) || numel(par.(name)) ~= n
      error('Field "%s" must have %d elements',name,n) 
   end   
end
end

end
