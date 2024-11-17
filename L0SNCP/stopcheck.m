%% Termination condition checking function.

function stop=stopcheck(timerun,stopindex)
    stop=0;
    if(stopindex==1)
        if(timerun(end)>100)  % This statement means is: when the running time exceeds 100 seconds, the algorithm terminates. 
        stop=1;
        end
   elseif(stopindex==2)
        if(timerun(end)>200)  % This statement means is: when the running time exceeds 200 seconds, the algorithm terminates. 
        stop=1;
        end
    end
end