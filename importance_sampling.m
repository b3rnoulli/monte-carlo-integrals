function [ result, v_n ] = importance_sampling(number_of_iterations, limits, sampling_function,... 
    normalization_coefficient, integral_function)


v =rand([1 number_of_iterations]);

result = normalization_coefficient/number_of_iterations * sum(v.^(1/3));

v_n=(normalization_coefficient.^2)/number_of_iterations.*sum(v.^(2/3)) - result.^2;
end

