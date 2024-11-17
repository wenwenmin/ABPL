clear
clc
%% Parameter.
%   dimension : The ranks of matrix decomposition
%   index     : The dataset to be used, when index=1, use mycielskian12 dataset,
%               when index=2, use lp_ship12l dataset
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
%% Display
%   nonzero   ：The number of non-zero elements in each component.
%   Rel       : The difference in the objective function value between two iterations.

%% Parameter settings
rng('shuffle')
warning('off');
dimension=[300,300]; 
index=1;
maxiteropt=60000;
r=1.5;
bt=0.6;
t=1.1;
btmax=0.9999;
trigger=[0,1];
objs=[1,2];
percent=0.3;
stopindex=2;





%% Algorithm iteration starts
[ngmar,dimension]=readfile(index,dimension);
for i=1:length(dimension)-1
    pere(i)=dimension(i)*dimension(i+1)*percent;
end
aa=pere;
num=length(dimension)-1;
for i=1:num
    var{i}=sprand(dimension(i),dimension(i+1),aa(i)/(2*dimension(i)*dimension(i+1)));
    var{i}=full(var{i});
end
for i=1:length(trigger)       
[datas{i},vars{i}]=ALGOchoose(var,ngmar,aa,maxiteropt,bt,objs,num,trigger(i),stopindex,r,t,btmax);
end


%% Drawing
plt=plotplt(datas,objs,trigger);







