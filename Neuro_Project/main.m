clc
clear vars
close all

%% Model Constants
N = 36; M = 100; Q = 10; T = 4000; dt = 0.001; l = 0.33; r = 0.36;
diff_vals = 1:0.05:2;
K = length(diff_vals);
P_tot_diff = zeros(M,T,Q,K);
thetas = zeros(T,Q,K);
%custom_theta = cat(1,-pi/6.*ones(T/2,1),pi/4.*ones(T/2,1));
tic
for k = 1:K
    D_amp = diff_vals(k);
    v_amp = 1;
    [time,phases,pos_theta,der1,der2,v,D,a] = gen_parameters(N,M,T,dt,l,r,v_amp,D_amp);
    rates = gen_rate(phases,pos_theta);
    for q = 1:Q
        thetas(:,q,k) = rand_walk(1,T,a,r,l);
        [R,row,col] = generate_data(N,T,dt,gen_rate(phases,thetas(:,q,k)));  %col might be switched with row
        P_tot_diff(:,:,q,k) = execution(M,T,dt,v,D,der1,der2,rates,row,col);
    end
    disp(k)
end
toc
save("data.mat","P_tot_diff","R","time","thetas","pos_theta","diff_vals","-v7.3")