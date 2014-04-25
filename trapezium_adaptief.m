function I = trapezium_adaptief(f,a,b,e )
    t1=trapezium(f,a,b,2);
    t2=trapezium(f,a,b,3);
    if abs(t1-t2)<e
        I=t2;
    else
        I=trapezium_adaptief(f,(a+b)/2,b,e)+ trapezium_adaptief(f,a,(a+b)/2,e);
    end
end

