%please run mysolve.m before running this program
L=1;
xg=linspace(0,L,10000);
g=0.01*(sin(4*pi*xg.^2)).^2.*xg.*(1-xg);g=g';
figure(1)
plot(xg,g);
hold on
N=8;
y=linspace(0,L,N+1);
plot(y,u_niu8);
hold on
N=16;
y=linspace(0,L,N+1);
plot(y,u_niu16);
hold on
N=32;
y=linspace(0,L,N+1);
plot(y,u_niu32);
legend('g0','h=1/8','h=1/16','h=1/32');
title('the normal displacement and g0(the thickness) on \Gamma3');
figure(2)
plot(y,u_tao32);
title('the tangential displacement on \Gamma3')
figure(3)
x=linspace(0,L,N+1);
[x,y]=meshgrid(x,y);
pcolor(x,y,phi32);
colorbar;
shading interp;
title('the eletric potential on \Omega');
clear g L r xg y x 