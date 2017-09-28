function [result, v_n ] = crude(integral_function, number_of_iterations, limits)

x = zeros(1,number_of_iterations);
for i=1:1:number_of_iterations
    x(i) = limits(1) + rand*(limits(2)-limits(1));
end
result = (limits(2)-limits(1))/number_of_iterations * sum(integral_function(x));

i_n = ((limits(2)-limits(1))./number_of_iterations).*sum(integral_function(x));
v_n = ((limits(2)-limits(1)).^2)./number_of_iterations.*(sum(integral_function(x).^2))-i_n.^2;

end

