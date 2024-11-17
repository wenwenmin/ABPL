%% Calculate the value of the objective function
function loss=compute(var,num,ngmar)
    nga=var{1};
    for i=2:num
        nga=nga*var{i};
    end
    loss=norm(ngmar-nga,'fro');
end