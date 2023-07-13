function P = genP(M,T)
    P = zeros(M,T);
    P_0 = rand(M,1);
    P_0 = P_0./sum(P_0);    % normalize
    P(:,1) = P_0;
end