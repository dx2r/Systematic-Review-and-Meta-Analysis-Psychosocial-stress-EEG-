function [p_mean] = calculate_pooled_mean(pop,mean)
%%%
% Function that calculates the pooled mean using the following formula:
%
% mean_pooled = (n_1*mean_1 + n_2*mean_2 + ... + n_k*mean_k)/(n_1 + n_2 + ... + n_k)
% 
% with: 
%   n_i = population size of study/result i
%   mean_i = mean of study/result i 
%
% INPUT:
%   pop = 1*N vector containing the population samples of N studies/results
%   mean = 1*N vector containing the means of N studies/results
%
% OUTPUT:
%   p_mean = the pooled mean 
%
% Gert Vanhollebeke - 21/5/2021
%
%%%

%get amount of studies
s_pop = size(pop,2);
s_mean = size(mean,2);

%check is same size
if s_pop == s_mean %same size
    s = s_pop;
    mean_tot = 0;
    n_tot = 0;
    for i = 1:s
        n_i = pop(1,i); %get the amount of participants for study i
        m_i = mean(1,i); %get the mean value for study i
        mean_tot = mean_tot + (n_i*m_i); %update numerator
        n_tot = n_tot + n_i; %update denominator
    end
    %calculate pooled mean
    p_mean = mean_tot/n_tot;
else %not same size
    error('amount is different between population size vector and mean vector.'); %problem for function
end
end