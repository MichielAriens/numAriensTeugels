%bereken a_i voor graden n = 1:20
n = 20;

%f opstellen
f = @(x) exp(x);

%Stel A en b op voor graad 20 
%(deze bevat de deelmatrices voor graden 1:20)
[A,b] = stelsel_monomiaal(f,n);

e = zeros(1,n);
%Bereken de fout voor graad i = 1:n
for i = 1:n
    %Bereken a_i
    a = A(1:i, 1:i)\b(1:i);
    %bereken de fout |f - g|
    fout = @(x) evalfout(f,a,x);
    e(i) = norm(quad(fout,-1,1,1e-8));

end

%bereken plotwaarden voor convergentie.
conv = @(x) 0.8.^(-x);
x = 1:n;

    

    
%berekening van d waarden
n = 20;
dA = zeros(n,1);
db = zeros(n,1);
da = zeros(n,1);

for i = 1:n
    [A1,b1] = stelsel_monomiaal(@(x) exp(x),i);
    [A2,b2] = stelsel_monomiaal_exp(i);
    
    %oplossingen
    a1 = A1\b1;
    a2 = A2\b2;

    %d-waarden 
    dA(i) = norm(A1 - A2,2)./norm(A2,2);
    db(i) = norm(b1 - b2,2)./norm(b2,2);
    da(i) = norm(a1 - a2,2)./norm(a2,2);
end

%Berekening van geschaleerde condtitie waarden
conds = zeros(1,n);
for i = 1:n
    conds(i) = cond(A(1:i, 1:i)) * 1e-8;
end

% Plot de fout ifv de graad. 
figure
semilogy(e,'-r');
hold on;
semilogy(conv(x),'-b');
semilogy(da,'-k');
semilogy(conds,'--k')
title('Absolute fouten ||f-g||, convergentiesnelheid, d_a en condities')
xlabel('graad')
ylabel('absolute waarde van de fout')
legend('absolute fout','convergentieSnelheid','d_a','conditie van A * integratieprecisie','location','SouthEast');

% Plot de d-waarden
x = 1:n;
figure
loglog(x,dA,x,db);
title('dA & db')
xlabel('graad')
ylabel('dA, db')
legend('dA','db','location','NorthWest');


    
    

    