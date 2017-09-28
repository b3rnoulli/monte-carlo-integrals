function [ result, v_n ] = anthitetic_variates(integral_function, number_of_iterations, limits )

x = zeros(1,number_of_iterations./2);
for i=1:1:(number_of_iterations/2)
    x(i) = limits(1) + rand*(limits(2)-limits(1));
end
x_prim = 1-x;

result = 1/number_of_iterations * ...
    sum(integral_function(x)+integral_function(x_prim));

i_n = (limits(2)-limits(1))./number_of_iterations.*sum(integral_function(x)+integral_function(x_prim));

v_n = ((limits(2)-limits(1)).^2)/number_of_iterations.*sum((integral_function(x)+integral_function(x_prim)).^2) - i_n^2;
end

