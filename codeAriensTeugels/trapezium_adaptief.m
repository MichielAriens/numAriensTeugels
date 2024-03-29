function I = trapezium_adaptief(f,a,b,e )
    
    %kijken of een van de eindpunten oneindig is en zo ja dit probleem verhelpen
    if ~isfinite(f(a))
        a=a+eps(a);
    end
    if ~isfinite(f(b))
        b=b-eps(b);
    end
    
    % I1 en I2 berekenen met trapezium-regel met 2 en 3 punten, dit komt neer op de trapezium-regel uitvoeren met 1 en 2 deelintervallen
    t1=trapezium(f,a,b,1);
    t2=trapezium(f,a,b,2);
    
    %oplossing berekenen
    if abs(t1-t2)<e
        I=t2;
    else
        I=trapezium_adaptief(f,(a+b)/2,b,e)+ trapezium_adaptief(f,a,(a+b)/2,e);
    end
end
