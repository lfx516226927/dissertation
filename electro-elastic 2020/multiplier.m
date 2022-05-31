function[new_niu,new_t1,new_t2,new_D]=multiplier(N,u1,u2,phi,l_niu,l_t1,l_t2,l_D)%update the multipliers
%parameters
c=0.01;
d=0.01;
rou=1;
phi0=0.03;
S=1;
L=1;
g=0.025;
%restrict u1,u2 and phi on boundary Gamma3
%u1 restricted on boundary Gamma3,which is u_niu
r=linspace(N,N^2,N);
u_niu=u1(r,1);%u_niu=u1
u_niu=[0;u_niu];
u_tao=u2(r,1);%u_tao=(0,u2),in the codes,u2 is u_tao
u_tao=[0;u_tao];
phi3=phi(r,1);
phi3=[0;phi3];
%update lambda_niu
r=l_niu+rou*(u_niu-g);
new_niu=max(r,0);
%update lambda_t1 and lambda_t2
L1=l_t1;
L2=l_t2+rou*u_tao;
new_t1=zeros(N+1,1);
new_t2=zeros(N+1,1);
for i=1:N+1
    t=S*miu(abs(u_tao(i)));
    k=sqrt(L1(i)^2+L2(i)^2);%2-norm
    if k<=t
        new_t1(i)=L1(i);
        new_t2(i)=L2(i);
    else
        new_t1(i)=(t/k)*L1(i);
        new_t2(i)=(t/k)*L2(i);
    end
end
%update lambda_D
new_D=zeros(N+1,1);
for i=1:N+1
    t=phi3(i)-phi0;
    h=he(u_niu(i)-g);
    if (t<=0)||(h<=0)
        new_D(i)=0;
    elseif t>10^(-5)
        new_D(i)=h*(c*exp(-c*t)+d);
    else
        new_D(i)=min(h*(c+d),max(0,l_D(i)+rou*h*t));
    end
end
new_niu=sparse(new_niu);
new_t1=sparse(new_t1);
new_t2=sparse(new_t2);
new_D=sparse(new_D);