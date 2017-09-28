function [result, v_n] = stratified_sampling(integral_function, number_of_iterations, limits)

lower_bound = limits(1,1);
upper_bound = limits(size(limits,1),2);
total_window_length =  upper_bound - lower_bound;

result = 0;
v_f = zeros(1,size(limits,1));
for i=1:1:size(limits,1)
    window_length(i) = limits(i,2) - limits(i,1);
    iterations_in_window(i) = number_of_iterations*(window_length(i)/total_window_length);
    [val, v_f(i)] = crude(integral_function, round(iterations_in_window(i)), limits(i,:));
    result = result + val;   
end

v_n = sum((window_length.^2)./(round(iterations_in_window)-1).*v_f);
end

