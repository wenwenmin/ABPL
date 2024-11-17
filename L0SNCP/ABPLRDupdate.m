%% The parameters update function of ABPL-random and ABPL+-random
function var=ABPLRDupdate(var,varze,num,ngmar,aa,r)
randsor=randperm(num);
for i=1:num
j=randsor(i);
V=grad(var,ngmar,j,num,r);
var{j}=PROX(varze{j},V,aa(j));
end
end