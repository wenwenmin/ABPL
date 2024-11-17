%% Read data set function
function [ngmar,num]=readfile(i)
   if(i==1) 
   E=load('.\Data\urban_traffic.mat');
   ngmar= E.ngmar;
   num=length(size(ngmar));
   elseif(i==2) 
   E=load('.\Data\PosteriorEmssion.mat');
   ngmar= E.tensor_nc_var;
   num=length(size(ngmar));
    end 
end