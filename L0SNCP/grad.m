%% Gradient calculation function for PALM, BPL, ABPL and ABPL+ 
function [U,L]=grad(var,ngmar,n,num,r)
  [Xtemp,temp]=krob2(var,n,num,ngmar);
   a=0;
   ck=norm(temp,'fro');
   L=ck;
   tao=1/(r*ck);
   if(temp==0) 
       while(a==0)
           a=rand(1);
       end
       tao=1/a;
   end
   mar=var{n}*temp-Xtemp;
   U=var{n}-tao*mar;
end