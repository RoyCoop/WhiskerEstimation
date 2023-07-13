function est = MLestimator(pos_theta,P)
    [~,maxindex] = max(P);
    est = pos_theta(maxindex);
end
