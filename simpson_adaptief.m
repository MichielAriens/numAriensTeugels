function I = simpson_adaptief(f,a,b,e )

    %kijken of een van de eindpunten oneindig is en zo ja dit probleem verhelpen
    if ~finity(f(a))
        a=a+eps(a);
    end
    if ~finity(f(b))
        b=b-eps(b);
    end
    
    % I1 en I2 berekenen met 3 en 5 punten, dit komt neer op simpson toepassen met 2 en 4 deelintervallen
    t1=simpson(f,a,b,2);
    t2=simpson(f,a,b,4);
    
    %oplossing berekenen
    if abs(t1-t2)<e
        I=t2;
    else
        I=simpson_adaptief(f,(a+b)/2,b,e)+ simpson_adaptief(f,a,(a+b)/2,e);
    end
end


