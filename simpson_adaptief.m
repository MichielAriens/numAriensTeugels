function I = simpson_adaptief(f,a,b,e )
    t1=simpson(f,a,b,2);
    t2=simpson(f,a,b,4);
    if abs(t1-t2)<e
        I=t2;
    else
        I=simpson_adaptief(f,(a+b)/2,b,e)+ simpson_adaptief(f,a,(a+b)/2,e);
    end
end


