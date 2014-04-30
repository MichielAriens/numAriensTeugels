function I = trapezium(f,a,b,n)

    %kijken of een van de eindpunten oneindig is en zo ja dit probleem verhelpen
    if ~finity(f(a))
        a=a+eps(a);
    end
    if ~finity(f(b))
        b=b-eps(b);
    end
    
    % grootte van een deelinterval
    g = (b-a)/n; 
    
    %functie evalueren in de grenzen van de deelintervallen
    x = a:g:b;
    fx = f(x);
    
    %oplossing berekenen
    I=0;
    for i = 2:n+1
        I = I + g*((fx(i-1) + fx(i))/2);
    end
    
    
    
