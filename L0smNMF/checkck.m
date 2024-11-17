%% Underflow handling of lipchitz constants
function ck=checkck(ck)
    if(ck==0) 
        a=0;
       while(a==0)
           a=rand(1);
       end
       ck=a;
     end
end