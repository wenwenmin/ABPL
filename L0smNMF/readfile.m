%% Read data set function
function [ngmar,dimension]=readfile(i,dimension)
   if(i==1) 
    E=load('.\Data\mycielskian12.mat');
    E=E.Problem;
    DATA = getfield (E, 'A');
    ngmar= full(DATA);
    dimension(end+1)=size(ngmar,2);
    dimension=[size(ngmar,1),dimension];
   elseif(i==2) 
    E=load('.\Data\lp_ship12l.mat');
    E=E.Problem;
    DATA = getfield (E, 'A');
    ngmar= full(DATA);
    dimension(end+1)=size(ngmar,2);
    dimension=[size(ngmar,1),dimension];
   end
   ngmar=abs(ngmar);
end