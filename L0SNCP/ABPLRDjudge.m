%% Restart steps of ABPL-random and ABPL+-random
function [bt,var,loss]=ABPLRDjudge(var,num,nga,ngak,ngmar,aa,vv,bt,tk,obj,varK,varze,r,btmax)
flag=0;
index=chencknon(vv,aa,num);
checkside=0;


if(index==0)
ngaV=compute(vv,ngmar);
    if(ngaV<=ngak)
        flag=1;
    else
        checkside=1;
    end
else
    checkside=1;
end

if(checkside)
    vartemp=ABPLRDupdate(varK,varze,num,ngmar,aa,r);
    ngai=compute(vartemp,ngmar);
    if(nga<ngai)
        flag=1;
    else
        flag=0;
   end

end

if(flag==1)         
        if(obj==1)
            bt=min(bt*tk,btmax);
        end
        loss=nga;
else    
        var=vartemp;
        if(obj==1)
            bt=bt/tk; 
        end
        loss=ngai;

end
end

%% Check whether the decomposition matrix meets the L0 norm requirement
function flag=chencknon(w,aa,num)
flag=0;
 for i=1:num
     ab=nnz(w{i}~=0);
     as=nnz(w{i}<0);
     if(as>0 || ab>aa(i))
         flag=1;
         return;
     end
 end
end




