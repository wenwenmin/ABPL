%% Input.
% var         : Initial matrix
% ngmar       : Decomposed tensor
% aa          : Maximum number of non-zero elements for each decomposition matrix
% The remaining parameters are explained the same as the 'main_Run_me' function

%% Output.
% vars:       : Decomposition matrix resulting from the final iterative result
% loss:       : Array of loss functions generated during iteration
% tr:         : Runtime array during iteration
% btss and atz: An array of extrapolated parameters produced by each algorithm during iteration,
%             : where btss represents the array of additional extrapolated parameters for algorithms, 
%             : and 'atz' represents the array of additional extrapolated parameters for IBPG and iPALM
%% An Accelerated Block Proximal method with Adaptive Momentum for Nonconvex and Nonsmooth Optimization

function [data,varss]=ALGOchoose(var,ngmar,aa,maxiteropt,bt,objs,num,N,flag,stopindex,r,t,btmax)
if(flag==0)
for i=1:(length(objs))
[vars,loss,tr,btss]=ABPL(var,ngmar,aa,maxiteropt,bt,objs(i),num,N,stopindex,r,t,btmax); %%ABPL-cyclic and ABPL+-cyclic
varss{i}=vars;
lossdata{i}=loss;
trdata{i}=tr;
btz{i}=btss;
end

elseif(flag==1)
   

for i=1:(length(objs))
[vars,loss,tr,btss]=ABPLRD(var,ngmar,aa,maxiteropt,bt,objs(i),num,N,stopindex,r,t,btmax);  %%ABPL-random and ABPL+-random
varss{i}=vars;
lossdata{i}=loss;
trdata{i}=tr;
btz{i}=btss;
end


end


data{1}=lossdata;
data{2}=trdata;
data{3}=btz;
end