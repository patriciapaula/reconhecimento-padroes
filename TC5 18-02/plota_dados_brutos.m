function []=plota_dados_brutos(h,e,n)
    hold on;
    for i=1:size(h,1) 
    	plot(h(i,2),h(i,1),'co'); 
    end
    for i=1:size(e,1) 
    	plot(e(i,2),e(i,1),'go'); 
    end
    for i=1:size(n,1) 
    	plot(n(i,2),n(i,1),'mo'); 
    end
    hold off;
    clf;
end