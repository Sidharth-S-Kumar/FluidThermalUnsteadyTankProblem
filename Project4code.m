%ME3492 Project 4 Kumar, Sidharth, Thomas,Mathew
%Constants/Givens/assumptions
TD = 25;%ft
e = 1.5E-4; % Roughness
PD = .4635; % ft
Ktot = .5+10+1.4*2;
L = 150; %ft
h1 = 60;%ft 
h2 = 10;%ft
p1 = 0; %psig
p2 = 0; %psig
A1 = (TD^2*pi)/4;
A2 = (PD^2*pi)/4;
g = 32.2;%ft/s^2
rho = 1.94;
mu = 1.9E-5; %lbf*s/ft^2
f1 = .02;
f2 = 1;
DataHold1 = [];
DataHold2 = []; 
dt = 100; 
hOp = h1+h2 ;
time = 0; 

while (hOp>=h2)
time = time + dt; 
hOphold = hOp;
while(f1 ~= f2)
f2 = f1; 
V=((2*g*hOp)/(1-(A2/A1)^2+(f1*L)/PD+Ktot))^.5; 
Re = (rho*V*PD)/mu;
f1 = .25/(log10((e/3.7*PD)+5.74/(Re^.9))^2);
DataHold1 = [DataHold1;f2,f1,V,Re];
end
dh = -A2/A1*V*dt;
hOp = hOp+dh;
DataHold2 = [DataHold2;hOphold,hOp,dh,V,Re,f1,time,PD];
DataHold1 = [DataHold1;0,0,0,0];
f1 = .02; 
end 
