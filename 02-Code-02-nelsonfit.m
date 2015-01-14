function[par] = nelsonfit(x,y)
% NELSONFIT Fit Nelson-Siegel function 
% Inputs    x,y - n*1 or 1*n vectors
% Outputs   par - structure with fields 'beta' (3*1 vector), 'tau' (scalar)
% Notes     No non-negativity constraints are imposed on betas; taus are
%           searched over by FMINBND within range (0,10).
% Example   x = [.125 .25  .5   1    2    3    5    7    10   20   30]
%           y = [2.57 3.18 3.45 3.34 3.12 3.13 3.52 3.77 4.11 4.56 4.51]
%           par = nelsonfit(x,y)
% Author    Dimitri Shvorob, dimitri.shvorob@vanderbilt.edu, 12/30/07

par.tau  = fminbnd(@(tau) nelsonsse(tau),0,10);
par.beta = lsbetas(par.tau);

    function[f] = nelsonsse(tau)
    [b,f] = lsbetas(tau);                        %#ok
    end

    function[b,varargout] = lsbetas(tau)
    i = x(:)/tau;
    j = 1-exp(-i);
    n = length(x);
    z = [ones(n,1) j./i (j./i)+j-1];
    b = (z'*z)\(z'*y(:)); 
    e = y(:) - z*b;
    varargout(1) = {e'*e};
    end    
        
end
