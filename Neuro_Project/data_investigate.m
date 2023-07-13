load("data.mat")
ML_est = squeeze(MLestimator(pos_theta,P_tot_diff));
mse_diff = squeeze(mean(MSE(thetas,ML_est),2));
%plot(time,ML_est(:,:,1),'.','DisplayName','ML');hold on; plot(time,thetas(:,1),'.','DisplayName','theta');legend();
%plot(time,mse_diff);