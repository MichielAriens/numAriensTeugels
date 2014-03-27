function I = trapezium(f,a,b,n)
    g = (b-a)/n; % grootte van een deelinterval
    x = a:g:b;
    fx = f(x);
    
    I = 0;
    for i = 2:size(x)
        I = I + g*((fx(i-1) + fx(i))/2);
    end
