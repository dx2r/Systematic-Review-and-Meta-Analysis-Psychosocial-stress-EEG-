function [p_var, p_std] = calculate_pooled_variance_and_std(pop,var)
%%%
% Function that calculates the pooled variance and std using the following formula:
%
% variance_pooled = ((n_1 - 1)*variance_1 + (n_2 - 1)*variance_2 + ... + (n_k - 1)*variance_k)/((n_1) + (n_2) + ... + (n_k) - k)
% std_pooled = sqrt(variance_pooled)
%
% with: 
%   n_i = population size of study/result i
%   variance_i = variance of study/result i 
%
% INPUT:
%   pop = 1*N vector containing the population samples of N studies/results
%   var = 1*N vector containing the variances of N studies/results
%
% OUTPUT:
%   p_var = the pooled variance
%   p_std = the pooled standard deviation
%
% Gert Vanhollebeke - 21-5-2021
%
%%%

%get amount of studies
s_pop = size(pop,2);
s_var = size(var,2);

%check is same size
if s_pop == s_var %same size
    s = s_pop;
    var_tot = 0;
    n_tot = 0;
    for i = 1:s
        n_i = pop(1,i);
        var_i = var(1,i);
        var_tot = var_tot + (n_i-1)*var_i;
        n_tot = n_tot + n_i;
    end
    n_tot = n_tot - s;
    %calculate pooled variance
    p_var = var_tot/n_tot;
    p_std = sqrt(p_var);
else %not same size
    error('amount is different between population size vector and variance vector.'); %problem for function
end
end

