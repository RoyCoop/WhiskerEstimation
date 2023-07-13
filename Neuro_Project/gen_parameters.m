function [time,phases,pos_theta,der1,der2,v,D,a] = gen_parameters(N,M,T,dt,l,r,v_amp,D_amp)
    phases = -pi:2*pi/N:(pi-2*pi/N);
    dphi = phases(2)-phases(1);
    a = 2*pi/M;
    v = v_amp.*(r - l) .* dphi./dt; D = D_amp.*((r + l) / 2) .* dphi.*dphi./dt;
    time = 0:dt:T*dt-dt;
    pos_theta = pi.*(-1:2/M:(1-2/M)).';
%% Generate derivative matrices
    der1 = discrete_der(M)./dphi;
    der2 = discrete_der2(M)./dphi./dphi;
end