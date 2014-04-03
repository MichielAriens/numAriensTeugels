function I=simpson(f,a,b,n)
    h = (b-a)/n;
    s=(f(a)-f(b));
    
    for i=1:2:n
        s=s+ 4*f(a+i*h);
    end
    for i=2:2:n-1
        s=s+2*f(a+i*h);
    end
    I= s*h/3;
    
