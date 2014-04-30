%functie 1
f1= @(x) exp(x);
%functie 2
f2= @(x) 1./(1+x.^2);
%integraal van functie 2;
f2i= @(x) atan(x);
n=3;
%ondergrens voor functie 1
a1=-1;
%bovengrens voor functie 1
b1=1;
%ondergrens voor functie 2
a2=-5;
%ondergrens voor functie 2
b2=5;
%hoogte van de intervallen voor functie 1
h1=(b1-a1)./x;
%hoogte van de intervallen voor functie 2
h2=(b2-a2)./x;
%aantal deelintervallen
x=round(logspace(1,n,200));

%aantal tijdsmetingen voor trapezium_adaptief en simpson_adaptief
num_tijdsmetingen=10;
%waarde van de exponent voor de grootste e-waarde
eExpBegin=-4;
%waarde van de exponent voor de kleinste e-waarde
eExpEinde=-12;

%de waarden van e berekenen
eDomein=eExpBegin:-1:eExpEinde;
eDomein=1*10.^eDomein;

% opslagruimte voor gemiddelde tijdsmeting per e maken
tijdperE_Trap=zeros(1,abs(eExpEinde-eExpBegin);
tijdperE_Simpson=zeros(1,abs(eExpEinde-eExpBegin);
tijdperE_Quad=zeros(1,abs(eExpEinde-eExpBegin);

%opslagruimte voor uitkomst integraal van functie 1 en 2 voor simpson- en trapezium-regel
f1Trap= zeros(1,length(x));
f1Simp=zeros(1,length(x));
f2Trap = zeros(1,length(x));
f2Simp = zeros(1,length(x));

%integralen uitrekenen.
for j=1:length(x);
	i=x(j);
    f1Trap(j)=trapezium(f1,a1,b1,i);
    f1Simp(j)=simpson(f1,a1,b1,i);
    f2Trap(j)=trapezium(f2,a2,b2,i);
    f2Simp(j)=simpson(f2,a2,b2,i);
end

%bererekenen van 'exacte' oplossing integraal functie 1
f1op=ones(1,length(x));
f1op= f1op.*(f1(1)-f1(-1));

%berekenen van 'exacte' oplossing integraal functie 2
f2op= ones(1,length(x));
f2op=f2op.*(f2i(5)-f2i(-5));

% absolute waarde van de relatieve fout berekenen;
f1RTrap = abs((f1Trap - f1op)./f1op);
f1RSimp = abs((f1Simp - f1op)./f1op);
f2RTrap = abs((f2Trap - f2op)./f2op);
f2RSimp = abs((f2Simp - f2op)./f2op);


%h1=(b1-a1)./x;

%plotten van de verschillende grafieken
figure
subplot(1,2,1);
title(' absolute waarde relatieve fout van trapezium- en simpson-regel integratie voor exp(x)');
legend('trapezium-regel','simpson-regel',h^1,h^4);
xlabel('grootte van deelintervallen');
ylabel('absolute waarde relatieve fout');
loglog(h1, f1RTrap, '-r');
hold on;
loglog(h1, f1RSimp, '--b');
loglog(h1,h1,'--g');
loglog(h1,(h1.^4)./90,'-g');

h2=(b2-a2)./x;
subplot(1,2,2);
title('absolute waarde reatieve fout van trapezium- en simpson-regel integratie voor 1./(1+x.^2)');
legend('trapzium-regel',(simpson-regel',h^1,h^4);
xlabel('grootte van deelintervallen');
ylabel('absolute waarde relatieve fout');
loglog(h2, f2RTrap, '-b');
hold on;
loglog(h2, f2RSimp, '-r');
loglog(h2,h2,'--g');
loglog(h1,(h1.^4)./90,'-g');

%tijdsmetingen uitvoeren voor de adaptive routines
for k=eDomein;
	uitTrap=0;
	uitSimp=0;
	uitQuad=0;
	for i=1:num_tijdsmetingen;
		tic;
		trapzium_adaptief(f2,a2,b2,k);
		uitTrap=uitTrap+toc;
		tic;
		simpson_adaptief(f2,a2,b2,k);
		uitSimp=uitSimp+toc;
		tic;
		tijdperE_Quad(f2,a2,b2,k);
		uitQuad=uitQuad+toc;
	end
	tijdperE_Trap(i)=uitTrap/num_tijdsmetingen;
	tijdperE_Simpson(i)=uitSimp/num.tijdsmetingen;
	tijdperE_Quad(i)=uitQuad/num.tijdsmetingen;
end

%plotten van uitkomsten van de gemiddelde tijdsmetingen voor verschillende e-waarden.
figure
title('tijdsmetingen afhankelijk van de waarde van e');
legend('trapezium adaptief','simpson adaptief','quad');
xlabel('waarde van e');
ylabel('gemiddelde gemeten tijd');
semilogX(eDomein,tijdperE_Trap,'-b');
hold on;
semilogX(eDomein,tijdperE_Simp,'-r');
semilogX(eDomein,tijdperE_Quad,'g');


	
