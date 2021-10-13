% Rótulo classe Hérnia de Disco [1 -1 -1] (60 primeiras linhas)
% Rótulo classe Espondilolistese [-1 1 -1] (150 linhas intermediárias)
% Rótulo classe Normal [-1 -1 1] (100 linhas finais)

function [hernia, esp,normal]=separa_classes(x)
    hernia=x(1:60,:);
    esp=x(61:210,:);
    normal=x(211:end,:);
end