function[A]=stiffness(N)
E=1;
kap=0.3;
%generate auxiliary matrices Aij Bij Gij,and save only Gij
A11=diag(4*ones(N,1))+diag(ones(N-1,1),-1)+diag(ones(N-1,1),1);
A11(N,N)=2;
A11=sparse(A11);
B11=diag((1/3)*ones(N,1))+diag((-1/6)*ones(N-1,1),-1)+diag((-1/6)*ones(N-1,1),1);
B11(N,N)=1/6;
B11=sparse(B11);
G11=kron(A11,B11);
A22=diag(2*ones(N,1))+diag(-ones(N-1,1),-1)+diag(-ones(N-1,1),1);
A22(N,N)=1;
A22=sparse(A22);
B22=diag((2/3)*ones(N,1))+diag((1/6)*ones(N-1,1),-1)+diag((1/6)*ones(N-1,1),1);
B22(N,N)=1/3;
B22=sparse(B22);
G22=kron(A22,B22);
A12=diag(-ones(N-1,1),-1)+diag(ones(N-1,1),1);
A12(N,N)=1;
A12=sparse(A12);
B12=diag((1/4)*ones(N-1,1),-1)+diag((-1/4)*ones(N-1,1),1);
B12(N,N)=1/4;
B12=sparse(B12);
G12=kron(A12,B12);
A21=diag(-ones(N-1,1),-1)+diag(ones(N-1,1),1);
A21(N,N)=-1;
A21=sparse(A21);
B21=diag((1/4)*ones(N-1,1),-1)+diag((-1/4)*ones(N-1,1),1);
B21(N,N)=-1/4;
B21=sparse(B21);
G21=kron(A21,B21);
clear A11 A22 A12 A21 B11 B22 B12 B21 
%calculate the stiffness matrix
A=E*kap/(1-kap^2)*(kron(sparse(1,1,1,3,3),G11)+kron(sparse(1,2,1,3,3),G21)...
+kron(sparse(2,1,1,3,3),G12)+kron(sparse(2,2,1,3,3),G22))...
+E/(1+kap)*(kron(sparse(1,1,1,3,3),G11)+kron(sparse(1,1,1/2,3,3),G22)...
+kron(sparse(2,1,1/2,3,3),G21)+kron(sparse(1,2,1/2,3,3),G12)...
+kron(sparse(2,2,1/2,3,3),G11)+kron(sparse(2,2,1,3,3),G22))...
+(kron(sparse(1,3,1/4,3,3),G11)+kron(sparse(2,3,1/4,3,3),G12)...
+kron(sparse(1,3,1/8,3,3),G22)+kron(sparse(2,3,1/8,3,3),G21))...
+(kron(sparse(3,3,5,3,3),G11)+kron(sparse(3,3,5,3,3),G22))...
-(kron(sparse(3,1,1/4,3,3),G11)+kron(sparse(3,2,1/4,3,3),G12) ...
+kron(sparse(3,1,1/8,3,3),G22)+kron(sparse(3,2,1/8,3,3),G21));
end

