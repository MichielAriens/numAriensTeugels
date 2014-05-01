n = 20
dA = zeros(n,1);
db = zeros(n,1);
da = zeros(n,1);

for i = 1:n
    [A1,b1] = stelsel_monomiaal(@(x) exp(x),i);
    [A2,b2] = stelsel_monomiaal_exp(i);

    a1 = A1\b1;
    a2 = A2\b2;

    dA(i) = norm(A1 - A2,2)./norm(A2,2);
    db(i) = norm(b1 - b2,2)./norm(b2,2);
    da(i) = norm(a1 - a2,2)./norm(a2,2);
end

x = 1:n;
clf;
loglog(x,dA,x,db);

cond(A1)

