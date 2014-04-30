function I=simpson(f,a,b,n)
    g = (b-a)/n; % grootte van een deelinterval
    x = a:g:b;
    if ~finity(f(a))
        a=a+eps(a);
    end
    if ~finity(f(b))
        b=b-eps(b);
    end
    fx = f(x);
    h = ((b-a)/n)/3;
    s=0;
    
    for j = 1:n/2
        i = 2*j + 1;
        s = s + fx(i-2) + 4*fx(i-1) + fx(i);
    end
    
    I = s*h;
    
