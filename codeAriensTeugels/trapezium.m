function I = trapezium(f,a,b,n)
    
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
    
    
    
