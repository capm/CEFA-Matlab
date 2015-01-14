% Example 1. Nelson-Siegel function: a sample shape
par.beta = [.05 -.1 .15]';
par.tau  = 1;
x = [.125 .25 .5 1 2 3 5 7 10 20 30];
y = nelsonfun(x,par);
figure
set(gcf,'Color','w')
plot(x,y)

% Example 2. Actual yield curve and NS approximation
x = [.125 .25  .5   1    2    3    5    7    10   20   30];
y = [2.57 3.18 3.45	3.34 3.12 3.13 3.52 3.77 4.11 4.56 4.51];
par = nelsonfit(x,y);
p = nelsonfun(x,par);
figure
set(gcf,'Color','w')
plot(x,y,'-rs'); hold on
plot(x,p,'-g' )
title('Nelson-Siegel approximation: example')
xlabel('Maturity, years')
legend('US Treasury yield curve (as of 12/28/07)', ...
      ['NS(\beta_{0} = '  sprintf('%3.2f',par.beta(1)) ',' ...
           '\beta_{1} = ' sprintf('%3.2f',par.beta(2)) ',' ...
           '\beta_{2} = ' sprintf('%3.2f',par.beta(3)) ',' ...
           '\tau = '      sprintf('%3.2f',par.tau)     ')'])
legend(gca,'boxoff')       
