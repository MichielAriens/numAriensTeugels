function [A,b] = stelsel_monomiaal(f,n)
    n = n+1;
    A = zeros(n);   % n x n matrix
    b = zeros(n,1);  % n x 1 vector
    err = 1e-8
    
    % Build A
    for i = 1:n
        for j = 1:n
            integrand = @(x) (x.^(i) .* x.^(j)); %The integrand
            A(i,j) = quad(integrand, -1, 1, err);
        end
    end
    
    %build b
    for i = 1:n
        integrand = @(x) (f(x) .* x.^(i));
        b(i) = quad(integrand, -1, 1, err);
    end
end

