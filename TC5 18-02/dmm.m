function g=dmm(z,m)
    c=cov(z);
    g=(z-m) * inv(c) * (z-m)';
end