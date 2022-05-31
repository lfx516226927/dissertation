function[h]=he(u)
de=0.005;
ke=1;
if u<=-de 
    h=0;
elseif u>0
    h=ke;
else
    h=(ke/de)*(u+de);
end
end