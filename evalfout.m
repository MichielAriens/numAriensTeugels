function e = evalfout(f,a,x)
    %UNTITLED Summary of this function goes here
    %   f = function handle
    %   a = a vector containing coefficients
    %   x = evaluation points

    %f(x)
    fx = f(x);
    %flip a to the correct orientation
    af = fliplr(a);
    gx = polyval(af,x);
    e = fx - gx;
end

