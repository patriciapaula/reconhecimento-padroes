function g=dmm2(z,m,c1,c2,c3)
    n1=size(c1,1);
    n2=size(c2,1);
    n3=size(c3,1);
    n=n1+n2+n3;
    
    c1=c1(:,1:2);
    c2=c2(:,1:2);
    c3=c3(:,1:2);
            
    c=(1/n).*[(n1.*cov(c1))+(n2.*cov(c2))+(n3.*cov(c3))];
        
    g=(z-m) * inv(c) * (z-m)';
end