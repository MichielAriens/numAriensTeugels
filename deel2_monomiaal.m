%c) bereken ai voor graden n = 1:20
    n = 20;
    
    %f opstellen
    f = @(x) exp(x);

    %Stel A en b op voor graad 20 
    %(deze bevat de deelmatrices voor graden 1:20)
    [A,b] = stelsel_monomiaal(f,n);
    
    %Bereken de fout voor graad i = 1:n
    e = zeros(1,n);
    for i = 1:n
        %Bereken a_i
        a = A(1:i, 1:i)\b(1:i);
        %bereken de fout ||f - g||
        poly = @(x) polyval(fliplr(a),x);
        e(i) = abs(quad(f,-1,1,1e-8) - quad(poly,-1,1,1e-8));
    end
%d)
    
    