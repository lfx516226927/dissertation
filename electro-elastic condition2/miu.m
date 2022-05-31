function[m]=miu(t)
a=0.04;
b=0.02;
alpha=100;
m=(a-b)*exp(-alpha*t)+b;
end