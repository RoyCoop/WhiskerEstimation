function [R,row,col] = generate_data(N,T,dt,rates)
    R = (rand(N,T) < rates*dt);
    [row,col] = find(R==1);
    R = double(R);
end