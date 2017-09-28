function [result,  v_n] = hit_or_miss(integral_function, number_of_iterations, limits)

random_points = rand([2 number_of_iterations])';
hit_count = 0;
miss_count = 0;
y_max = find_max(integral_function, limits);
function_values = zeros(1, number_of_iterations);
for i=1:1:number_of_iterations
    function_values(i) = integral_function(random_points(i,1));
    if random_points(i,2) < (function_values(i)/y_max)
        hit_count = hit_count + 1;
    else
        miss_count = miss_count + 1;
    end
end
result = (limits(2)-limits(1))*y_max*hit_count/number_of_iterations;

i_n = (limits(2)-limits(1))*y_max*hit_count/number_of_iterations;
v_n = (limits(2)-limits(1))*y_max.^2*hit_count/number_of_iterations-i_n.^2;
end

function max_value = find_max(fun, limits)

max_value = fun(limits(1));
for i=limits(1):0.01:limits(2)
    if max_value < fun(i)
        max_value = fun(i);
    end
end

end