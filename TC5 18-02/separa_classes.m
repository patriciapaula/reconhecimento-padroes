% R�tulo classe H�rnia de Disco [1 -1 -1] (60 primeiras linhas)
% R�tulo classe Espondilolistese [-1 1 -1] (150 linhas intermedi�rias)
% R�tulo classe Normal [-1 -1 1] (100 linhas finais)

function [hernia, esp,normal]=separa_classes(x)
    hernia=x(1:60,:);
    esp=x(61:210,:);
    normal=x(211:end,:);
end