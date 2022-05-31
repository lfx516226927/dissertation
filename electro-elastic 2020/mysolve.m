maxstep=1000;%maximum iteration step
%N=8
N=8;
l_niu=zeros(N+1,1);l_niu=sparse(l_niu);
l_t1=zeros(N+1,1);l_t1=sparse(l_t1);
l_t2=zeros(N+1,1);l_t2=sparse(l_t2);
l_D=zeros(N+1,1);l_D=sparse(l_D);
i=0;
while (i<maxstep)
A=stiffness(N);
F=rightterm(N,l_niu,l_t1,l_t2,l_D);
u=linsolve(full(A),full(F));
u=sparse(u);
u1=u(1:N^2,1);
u2=u(N^2+1:2*N^2,1);
phi=u(2*N^2+1:3*N^2,1);
[l_niu,l_t1,l_t2,l_D]=multiplier(N,u1,u2,phi,l_niu,l_t1,l_t2,l_D);
i=i+1;
end
clear A F i l_niu l_t1 l_t2 l_D 
r=linspace(N,N^2,N);
u_niu8=[0;u1(r,1)];
u_tao8=[0;u2(r,1)];
phi8=reshape(phi,[N,N])';
phi8=[zeros(N,1) phi8];
phi8=[zeros(1,N+1);phi8];
%N=16
N=16;
l_niu=zeros(N+1,1);l_niu=sparse(l_niu);
l_t1=zeros(N+1,1);l_t1=sparse(l_t1);
l_t2=zeros(N+1,1);l_t2=sparse(l_t2);
l_D=zeros(N+1,1);l_D=sparse(l_D);
i=0;
while (i<maxstep)
A=stiffness(N);
F=rightterm(N,l_niu,l_t1,l_t2,l_D);
u=linsolve(full(A),full(F));
u=sparse(u);
u1=u(1:N^2,1);
u2=u(N^2+1:2*N^2,1);
phi=u(2*N^2+1:3*N^2,1);
[l_niu,l_t1,l_t2,l_D]=multiplier(N,u1,u2,phi,l_niu,l_t1,l_t2,l_D);
i=i+1;
end
clear A F i l_niu l_t1 l_t2 l_D 
r=linspace(N,N^2,N);
u_niu16=[0;u1(r,1)];
u_tao16=[0;u2(r,1)];
phi16=reshape(phi,[N,N])';
phi16=[zeros(N,1) phi16];
phi16=[zeros(1,N+1);phi16];
%N=32
N=32;
l_niu=zeros(N+1,1);l_niu=sparse(l_niu);
l_t1=zeros(N+1,1);l_t1=sparse(l_t1);
l_t2=zeros(N+1,1);l_t2=sparse(l_t2);
l_D=zeros(N+1,1);l_D=sparse(l_D);
i=0;
while (i<maxstep)
A=stiffness(N);
F=rightterm(N,l_niu,l_t1,l_t2,l_D);
u=linsolve(full(A),full(F));
u=sparse(u);
u1=u(1:N^2,1);
u2=u(N^2+1:2*N^2,1);
phi=u(2*N^2+1:3*N^2,1);
[l_niu,l_t1,l_t2,l_D]=multiplier(N,u1,u2,phi,l_niu,l_t1,l_t2,l_D);
i=i+1;
end
clear A F i l_niu l_t1 l_t2 l_D 
r=linspace(N,N^2,N);
u_niu32=[0;u1(r,1)];
u_tao32=[0;u2(r,1)];
phi32=reshape(phi,[N,N])';
phi32=[zeros(N,1) phi32];
phi32=[zeros(1,N+1);phi32];
clear maxstep u