% class 1 59 
% class 2 71
% class 3 48
function [c1, c2, c3]=separa_classes(x)
    c1=x(1:59,:);
    c2=x(60:130,:);
    c3=x(131:end,:);
end