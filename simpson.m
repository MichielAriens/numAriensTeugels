function I=simpson(f,a,b,n)
    % grootte van een deelinterval
    g = (b-a)/n; 
    
    %kijken of een van de eindpunten oneindig is en zo ja dit probleem verhelpen
    if ~finity(f(a))
        a=a+eps(a);
    end
    if ~finity(f(b))
        b=b-eps(b);
    end
    
    %functiewaarden voor grenzen deelintervallen berekenen
    x = a:g:b;
    fx = f(x);
    
    %grootte deelintervallen berekenen
    h = ((b-a)/n)/3;
    
    %oplossing berekenen
    s=0;
    for j = 1:n/2
        i = 2*j + 1;
        s = s + fx(i-2) + 4*fx(i-1) + fx(i);
    end
    I = s*h;
    
