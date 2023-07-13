function P = execution(M,T,dt,v,D,der1,der2,rates,row,col)
%% Time evolution
    r_tot = sum(rates,1);
    P = genP(M,T);
    for t = 1:(T-1)
        r_tot_bar = r_tot*P(:,t);
        r_bar = 1./((rates)*P(:,t));
        nshot = r_tot_bar.*P(:,t) - r_tot.'.*P(:,t) ...
            + D .* der2*P(:,t) - v .* der1*P(:,t);
        shot = zeros(M,1);
        idx = row(col==t);
        if ~isempty(idx)   % the idx indicates a neuron had shot
           %[~,theta_idx] = min(abs(dtheta(phases,theta(t))));
           logrates = zeros(M,1);
           for id = 1:length(idx)
               logrates = logrates + log(rates(idx(id),:).' .* r_bar(idx(id)));
           end
           logrates = logrates./length(idx);
           shot = logrates .* P(:,t);
        end
        % update equation
        next_P = P(:,t) + (nshot).*dt + shot;
        next_P(next_P<0) = 0;   % it seems negative probability is possible?
        next_P = next_P./sum(next_P);
        P(:,t+1) = next_P;
    end
end