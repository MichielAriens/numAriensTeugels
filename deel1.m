f1= @(x) exp(x);
f2= @(x) 1./(1+x.^2);
f2i= @(x) atan(x);
n=3;
x=round(logspace(1,n,200));

f1Trap= zeros(1,length(x));
f1Simp=zeros(1,length(x));
f2Trap = zeros(1,length(x));
f2Simp = zeros(1,length(x));
for j=1:length(x);
	i=x(j);
    f1Trap(j)=trapezium(f1,-1,1,i);
    f1Simp(j)=simpson(f1,-1,1,i);
    f2Trap(j)=trapezium(f2,-5,5,i);
    f2Simp(j)=simpson(f2,-5,5,i);
end
%bererekenen van waarde integraal functie 1
f1op=ones(1,length(x));
f1op= f1op.*(f1(1)-f1(-1));

%berekenen van waarde integraal functie 2
f2op= ones(1,length(x));
f2op=f2op.*(f2i(5)-f2i(-5));

f1RTrap = (f1Trap - f1op)./f1op;
f1RSimp = (f1Simp - f1op)./f1op;

f2RTrap = (f2Trap - f2op)./f2op;
f2RSimp = (f2Simp - f2op)./f2op;

figure
semilogx(x, f1RTrap, '-b');
hold on;
semilogx(x, f1RSimp, '--b');

figure
semilogx(x, f2RTrap, '-r');
hold on;
semilogx(x, f2RSimp, '--r');




% figure
% loglog(x,f1Trap,'-b');
% hold on;
% loglog(x,f1Simp,'--b');
% loglog(x,f2Trap,'-r');
% loglog(x,f2Simp,'--r');
% loglog(x,f1op,'-g');
% 
% 

