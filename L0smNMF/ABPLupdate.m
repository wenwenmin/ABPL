%% The parameters update function of ABPL-cyclic and ABPL+-cyclic
function var=ABPLupdate(var,varze,num,ngmar,aa,r)
for j=1:num
V=grad(var,ngmar,j,num,r);
[var{j},~]=PROX(varze{j},V,aa(j));
end
end