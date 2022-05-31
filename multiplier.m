function[new_niu,new_t1,new_t2]=multiplier(N,u1,u2,l_niu,l_t1,l_t2)%update the multipliers
%parameters
rou=1;
S=1;
L=1;
y=linspace(0,L,N+1);
g=0.01*(sin(4*pi*y.^2)).^2.*y.*(1-y);g=g';
%restrict u1,u2 and phi on boundary Gamma3
%u1 restricted on boundary Gamma3,which is u_niu
r=linspace(N,N^2,N);
u_niu=u1(r,1);%u_niu=u1
u_niu=[0;u_niu];
u_tao=u2(r,1);%u_tao=(0,u2),in the codes,u2 is u_tao
u_tao=[0;u_tao];
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
new_niu=sparse(new_niu);
new_t1=sparse(new_t1);
new_t2=sparse(new_t2);