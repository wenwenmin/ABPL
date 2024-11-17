%% Proximal projection function
function X=PROX(x,U,a)
S=U(:);
[~,IX] = sort(S(:),'descend');
if(a>length(IX))
    a=length(IX);
end
x(IX(1:a))=U(IX(1:a));
X=x;
X(X<0)=0;
end

