%%  All parameters of this function are explained the same as 'main_Run_me' and 'ALGOchoose' functions
function [var,loss,timerun,bts]=ABPL(var,ngmar,aa,maxiteropt,bt,obj,num,N,stopindex,r,t,btmax)
%% initialization algorithm
loss=[];
timerun=[0];
tk=t;
tks=1;
for i=1:num
    varze{i}=zeros(size(ngmar,i),N);
end
bts=[];
varK=var;
for j=1:num
    fprintf("nonzero:%d\n",sum(sum(var{j}~=0)));
end
returnloss=norm(ngmar);
loss(1)=compute(var,ngmar);
t1=clock;


for i=1:maxiteropt
%% update parameters
fprintf("%d\n",i);
for j=1:num   
    vv{j}=var{j}+bt*(var{j}-varK{j});
end
varK=var;
var=ABPLupdate(vv,varze,num,ngmar,aa,r);
loss(i+1)=compute(var,ngmar);


%% Judging whether to extrapolate
[bt,var,loss(i+1)]=ABPLjudge(var,num,loss(i+1),loss(i),ngmar,aa,vv,bt,tk,obj,varK,varze,r,btmax);
bts(i)=bt;
if(obj==2)
    tktemp=tks;
    tks=(1+sqrt(1+4*tks^2))/2;
    bt=(tktemp-1)/(tks);
end

%% Check if termination condition is met
fprintf("ABPL\n");
for j=1:num
    fprintf("nonzero:%d\n",nnz(var{j}~=0));
end
t2=clock;
timerun(i+1)=etime(t2,t1);
ReeK=loss(i)/returnloss;
Ree=loss(i+1)/returnloss;
Res=abs(Ree-ReeK);
fprintf("Rel：%d\n",Res);
stop=stopcheck(timerun,stopindex);
if(stop==1)
    fprintf("Number of terminations：%d\n",i);
    pause(4);
    break;
end
end
end















