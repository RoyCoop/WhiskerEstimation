function theta = rand_walk(n,T,a,r,l)
    num = rand(T,n);
    walk = -ones(T,n).*a .*(num < l) + ones(T,n).*a.*(num < l+r).*(num >= l);
    theta = angle(exp(1i.*cumsum(walk,1)));
end