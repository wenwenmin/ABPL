%% Matrixed tensor times Khatri-Rao product calculation function
function [Xtemp,B]=krob2(var,n,num,ngmar)
Xtemp=mttkrp(ngmar,var,n);
index=[1:num];
index(n)=[];
len=length(index);
B=var{index(len)}'*var{index(len)};
for j=1:length(index)-1
    B=B.*(var{index(len-j)}'*var{index(len-j)});
end
end