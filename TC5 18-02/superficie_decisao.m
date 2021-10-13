function []=superficie_decisao(v, m1, m2, m3, classificador, exibesd)
    if classificador==1 %linear
        superficie_linear(m1, m2, m3, exibesd);
    else % quadratico
        superficie_dmm(v, m1, m2, m3);
    end
end