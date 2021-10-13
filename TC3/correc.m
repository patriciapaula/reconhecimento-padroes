function R=correc(X)
    R=eye(6,6)
    a=5/6
    for j=1:6
        for n=1:6
            if n~=j
                R(j,n)=a*R(j,n-1)+(1-a)*X(j,n)'*X(j,n)
            else
                R(j,n)=a*R(j,n)+(1-a)*X(j,n)'*X(j,n)
            end
        end
    end
end