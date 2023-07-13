function der2 = discrete_der2(N)
    der2 = -2.*eye(N);
    for ix = 1:N
        for jx = 1:N
           if ix == mod(jx-1,N+1)
               der2(ix,jx) = 1;
           end
           if ix == mod(jx+1,N+1)
               der2(ix,jx) = 1;
           end
           if and(ix == 1,jx == N)
               der2(ix,jx) = 1;
               der2(jx,ix) = 1;
           end
        end
    end
end