clear
clc
%% Parameter.
%   N         : Rank of Tensor CP Decomposition
%   index     : The dataset to be used, when index=1, use urban_traffic dataset,
%               when index=2, use PosteriorEmssion dataset
%   bt        : Initial extrapolation parameter values of ABPL+
%   btmax     : Maximum extrapolation parameter values of ABPL+
%   t         : Decay and increment rates for extrapolation parameters for ABPL+
%   r         : Step factor
%   maxiteropt: Maximum iteration alloted to the algorithm
%   trigger   : Whether to enable the indicator array of each algorithm, where
%               when 0∈trigger, enable the ABPL+-cyclic algorithm
%               when 1∈trigger, enable the ABPL+-random algorithm 
%   objs      : Whether to enable ABPL+'s adaptive momentum, when
%               when 1∈objs, enable the adaptive momentum
%               when 2∈objs, enable the non-adaptive momentum
%   percent   ：The proportion of non-zero elements allowed in each decomposition matrix
%   stopindex : The indicator of the stop condition. 
%               To set the specific termination condition, see the 'stopcheck' function for details.  
%               The default termination condition is: each algorithm runs for 100 seconds
% Display
%   nonzero   ：The number of non-zero elements in each component.
%   Rel       : The difference in the objective function value between two iterations.

%% Parameter settings
warning('off');
rng('shuffle')
N=50;
index=1;
bt=0.2;
btmax=0.9999;
t=1.3;
r=1.5;
maxiteropt=6000000;
trigger=[0,1];
objs=[1,2];
percent=0.3;
stopindex=1;





%% Algorithm iteration starts
[ngmar,num]=readfile(index);

ngmar=tensor(ngmar);
for i=1:length(size(ngmar))
    pere(i)=N*size(ngmar,i)*percent;
end
aa=pere;
for i=1:num
    den=size(ngmar,i)*N;
    var{i}=sprand(size(ngmar,i),N,aa(i)/(2*den));
    var{i}=full(var{i});
end
for i=1:length(trigger)
[datas{i},vars{i}]=ALGOchoose(var,ngmar,aa,maxiteropt,bt,objs,num,N,trigger(i),stopindex,r,t,btmax);
end
datas{length(trigger)+1}=var;


%% Drawing
plt0=plotplt(datas,objs,trigger);








