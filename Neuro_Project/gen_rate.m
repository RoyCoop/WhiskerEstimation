function r = gen_rate(phases,theta)
    r_avg = 11; r_amp = 10;
    r = r_avg + r_amp .* cos(phases-theta).';
end