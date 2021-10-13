function []=superficie_linear(c1, c2, c3, plota)
    % se quer plotar centroides
    if plota==1
        % plota centróides
        plot(c1(1,2),c1(1,1),'bO');
        plot(c2(1,2),c2(1,1),'bO');
        plot(c3(1,2),c3(1,1),'bO');
    
        yd1=[c1(:,1) c2(:,1)];
        yd2=[c1(:,1) c3(:,1)];
        yd3=[c2(:,1) c3(:,1)];
        xd1=[c1(:,2) c2(:,2)];
        xd2=[c1(:,2) c3(:,2)];
        xd3=[c2(:,2) c3(:,2)];
        
        line (xd1,yd1,'Color','y');
        line (xd2,yd2,'Color','y');
        line (xd3,yd3,'Color','y');

        % ponto medio  para passar as superficies de decisao (media dos centroides) 
        % e equação de reta

        % c1 e c2
        xm12=(c1(:,2)+c2(:,2))/2;
        ym12=(c1(:,1)+c2(:,1))/2;
        plot(xm12,ym12,'b*');

        % c1 e c3
        xm13=(c1(:,2)+c3(:,2))/2;
        ym13=(c1(:,1)+c3(:,1))/2;
        plot(xm13,ym13,'r*');

        % c2 e c3
        xm23=(c2(:,2)+c3(:,2))/2;
        ym23=(c2(:,1)+c3(:,1))/2;
        plot(xm23,ym23,'g*');

        % y=a(x-xm) + ym => r1=a1*(x-xm12)+ym12;
        a1=(c1(:,1)-c2(:,1))/(c1(:,2)-c2(:,2));

        % y=a(x-xm) + ym => r2=a2*(x-xm13)+ym13;
        a2=(c1(:,1)-c3(:,1))/(c1(:,2)-c3(:,2));

        % y=a(x-xm) + ym => r3=a3*(x-xm23)+ym23;
        a3=(c2(:,1)-c3(:,1))/(c2(:,2)-c3(:,2));

        % *** REVER CALCULO PARA RETIRAR VALOR FIXO ***
        %a1=-0.6;
        %a2=7.9;
        %a3=-3.9;
        
        cont=1;
        for w=0:0.1:0.4
            sd1(cont,:)=[a1*(w-xm12)+ym12 w];
            cont=cont+1;
        end
        
        cont=1;
        for w=0:0.1:0.4
            sd2(cont,:)=[a2*(w-xm13)+ym13 w];
            cont=cont+1;
        end
        
        cont=1;
        for w=0:0.1:0.4
            sd3(cont,:)=[a3*(w-xm23)+ym23 w];
            cont=cont+1;
        end
        
        plot(sd1(:,2),sd1(:,1),'color','b');
        plot(sd2(:,2),sd2(:,1),'color','b');
        plot(sd3(:,2),sd3(:,1),'color','b');
    end
end