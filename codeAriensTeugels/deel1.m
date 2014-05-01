%functie 1
f1= @(x) exp(x);
%functie 2
f2= @(x) 1./(1+x.^2);
%integraal van functie 2;
f2i= @(x) atan(x);
n=3;
%aantal deelintervallen
x=round(logspace(1,n,200));
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


%aantal tijdsmetingen voor trapezium_adaptief en simpson_adaptief
num_tijdsmetingen=10;
%waarde van de exponent voor de grootste e-waarde
eExpBegin=-4;
%waarde van de exponent voor de kleinste e-waarde
eExpEinde=-10;

%de waarden van e berekenen
eDomein=eExpBegin:-1:eExpEinde;
eDomein=1*10.^eDomein;

% opslagruimte voor gemiddelde tijdsmeting per e maken
tijdperE_Trap=zeros(1,abs(eExpEinde-eExpBegin));
tijdperE_Simpson=zeros(1,abs(eExpEinde-eExpBegin));
tijdperE_Quad=zeros(1,abs(eExpEinde-eExpBegin));

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

% absolute waarde van de absolute fout berekenen;
f1RTrap = abs(f1Trap - f1op);
f1RSimp = abs(f1Simp - f1op);
f2RTrap = abs(f2Trap - f2op);
f2RSimp = abs(f2Simp - f2op);



%plotten van de verschillende grafieken
figure
subplot(1,2,1);

loglog(h1, f1RTrap, '-k');
hold on;
loglog(h1, f1RSimp, '--g');
loglog(h1,h1,'--b');
loglog(h1,h2.^2,'-b');
loglog(h1,(h1.^4)./90,'-r');
title(' absolute waarde absolute fout van trapezium- en simpson-regel integratie voor exp(x)');
legend('trapezium-regel','simpson-regel','h^1','h^2','h^4','Location','SouthEast');
xlabel('grootte van deelintervallen');
ylabel('absolute waarde relatieve fout');


subplot(1,2,2);
loglog(h2, f2RTrap, '-k');
hold on;
loglog(h2, f2RSimp, '--g');
loglog(h2,h2,'--b');
loglog(h2,h2.^2,'-b');
loglog(h2,(h2.^4)./90,'-r');
title('absolute waarde absolute fout van trapezium- en simpson-regel integratie voor 1./(1+x.^2)');
legend('trapzium-regel','simpson-regel','h^1','h^2','h^4','Location','SouthEast');
xlabel('grootte van deelintervallen');
ylabel('absolute waarde relatieve fout');
%tijdsmetingen uitvoeren voor de adaptive routines
for m=1:length(eDomein);
    k=eDomein(m);
	uitTrap=0;
	uitSimp=0;
	uitQuad=0;
	for i=1:num_tijdsmetingen;
		tic;
		trapezium_adaptief(f2,a2,b2,k);
		uitTrap=uitTrap+toc;
		tic;
		simpson_adaptief(f2,a2,b2,k);
		uitSimp=uitSimp+toc;
		tic;
		quad(f2,a2,b2,k);
		uitQuad=uitQuad+toc;
	end
	tijdperE_Trap(m)=uitTrap/num_tijdsmetingen;
	tijdperE_Simpson(m)=uitSimp/num_tijdsmetingen;
	tijdperE_Quad(m)=uitQuad/num_tijdsmetingen;
end

%theoretische uitvoertijd berekenen simpson
e=eDomein;
h=nthroot(90.*e,5);
hbegin= b2-a2;
stappen=log(hbegin./h)./log(2);
stappen=round(stappen);
tSimp=2.^stappen-1;
%berekenen theoretische uitvoertijd quad
tQuad=tSimp*0.0005;
tSimp=tSimp.*0.0008;

%theoretische uitvoertijd berekenen trapezium
e=eDomein;
h=nthroot(12.*e,3);
hbegin= b2-a2;
stappen=log(hbegin./h)./log(4);
stappen=round(stappen);
tTrap=2.^stappen-1;
tTrap=tTrap.*0.00008;

%plotten van uitkomsten van de gemiddelde tijdsmetingen voor verschillende e-waarden.
figure
loglog(eDomein,tijdperE_Trap,'-b');
hold on;
loglog(eDomein,tijdperE_Simpson,'-r');
loglog(eDomein,tijdperE_Quad,'g');
loglog(eDomein,tTrap,'-k');
loglog(eDomein,tSimp,'--k');
loglog(eDomein,tQuad,'-m');
title('tijdsmetingen afhankelijk van de waarde van e');
legend('trapezium adaptief','simpson adaptief','quad','theoretisch trapezium','theoretisch Simp','theoretisch quad','Location','SouthWest');1
xlabel('waarde van e');
ylabel('gemiddelde gemeten tijd');

