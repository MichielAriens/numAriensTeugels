function [ Aster,bster ] = stelsel_monomiaal_exp(n)
% ouput:
%   A(i+1,j+1) = int_[-1,1] x^(i+j) dx
%   b(i+1)     = int_[-1,1] exp(x)*x^(i-1) dx
%
% Noot: als n te groot wordt, dan is de benadering voor b onnauwkeurig:
%    b(i) wordt benaderd tot op machine nauwkeurigheid als de integraal van
%    de Taylorreeks van exp(x)*x^(i-1).

mu = 2./(1:2*n+1); mu(2:2:end) = 0;
Aster = hankel(mu(1:n+1),mu(n+1:end));


N = 300;
K = 100;
mu = 2./(1:N); mu(2:2:end) = 0;
bster = zeros(n+1,1);
for k = 0:n
    bster(k+1) = sum(mu(k+1:k+K)./factorial(0:K-1));
end

% Minder efficiente code:
%
% Aster = zeros(n+1);
% for k = 0:n
%     for l = 0:n
%         if rem(k+l,2) 
%             % k+l oneven
%             Aster(k+1,l+1) = 0;
%         else
%             Aster(k+1,l+1) = 2/(k+l+1);
%         end
%     end
% end
