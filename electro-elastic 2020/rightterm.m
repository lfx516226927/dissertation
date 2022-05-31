%parameters:f0=0,f2=(k1x,k2x),q0=1,q2=0.
function[F]=rightterm(N,l_niu,l_t1,l_t2,l_D)
k1=0;
k2=-0.25;
L=1;
h=L/N;
%f21
a=k1*(h^2)*linspace(1,N,N);
a(1,N)=k1*(L*h/2-h^2/6);
f21=sparse(N^2-N+1:N^2,1,a,3*N^2,1);
%f22
a=k2*(h^2)*linspace(1,N,N);
a(1,N)=k2*(L*h/2-h^2/6);
f22=sparse(2*N^2-N+1:2*N^2,1,a,3*N^2,1);
%q
a=h^2*ones(N,1);
a(N,1)=a(N,1)/2;
b=ones(N,1);
b(N,1)=1/2;
c=sparse(3,1,1,3,1);
a=sparse(a);
b=sparse(b);
q0=kron(c,kron(b,a));
%lambda_niu
a=diag((1/6*h)*ones(N,1))+diag((2/3*h)*ones(N-1,1),1)+diag((1/6*h)*ones(N-2,1),2);
b=zeros(N,1);
b(N,1)=h/3;
b(N-1,1)=h/6;
a=[a b];
a=sparse(a);
l_niu=sparse(l_niu);
b=zeros(N,1);
b(N,1)=1;
b=sparse(b);
c=sparse(1,1,1,3,1);
L_NIU=kron(c,kron(a*l_niu,b));
%lambda_tao1
a=diag((1/6*h)*ones(N,1))+diag((2/3*h)*ones(N-1,1),1)+diag((1/6*h)*ones(N-2,1),2);
b=zeros(N,1);
b(N,1)=h/3;
b(N-1,1)=h/6;
a=[a b];
a=sparse(a);
l_t1=sparse(l_t1);
b=zeros(N,1);
b(N,1)=1;
b=sparse(b);
c=sparse(1,1,1,3,1);
L_T1=kron(c,kron(a*l_t1,b));
%lambda_tao2
a=diag((1/6*h)*ones(N,1))+diag((2/3*h)*ones(N-1,1),1)+diag((1/6*h)*ones(N-2,1),2);
b=zeros(N,1);
b(N,1)=h/3;
b(N-1,1)=h/6;
a=[a b];
a=sparse(a);
l_t2=sparse(l_t2);
b=zeros(N,1);
b(N,1)=1;
b=sparse(b);
c=sparse(2,1,1,3,1);
L_T2=kron(c,kron(a*l_t2,b));
%lambda_D
a=diag((1/6*h)*ones(N,1))+diag((2/3*h)*ones(N-1,1),1)+diag((1/6*h)*ones(N-2,1),2);
b=zeros(N,1);
b(N,1)=h/3;
b(N-1,1)=h/6;
a=[a b];
a=sparse(a);
l_D=sparse(l_D);
b=zeros(N,1);
b(N,1)=1;
b=sparse(b);
c=sparse(3,1,1,3,1);
L_D=kron(c,kron(a*l_D,b));
clear a b c;
F=f21+f22-L_NIU-(L_T1+L_T2)+L_D+q0;
clear f21 f22 L_NIU L_T1 L_T2 L_D q0
end