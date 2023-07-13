function der1 = discrete_der(N)
    der1 = -eye(N);
    for ix = 1:N
        for jx = 1:N
           if ix == mod(jx-1,N+1)
               der1(ix,jx) = 1;
           end
           if and(jx == 1,ix == N)
               der1(ix,jx) = 1;
           end
        end
    end
end
