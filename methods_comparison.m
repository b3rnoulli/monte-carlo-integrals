fun = @(x) x.^3;

number_of_points = 2000;
number_of_trials = 10000;
limits = [0 1];

crude_results = zeros(1,number_of_trials);
crude_v_n = zeros(1, number_of_trials);
hit_or_miss_results = zeros(1,number_of_trials);
hit_or_miss_v_n = zeros(1, number_of_trials);
stratified_equal_window_results = zeros(1,number_of_trials);
stratified_equal_window_v_n = zeros(1,number_of_trials);
stratified_custom_window_results = zeros(1,number_of_trials);
stratified_custom_window_v_n = zeros(1,number_of_trials);
importance_results = zeros(1,number_of_trials);
importance_v_n = zeros(1,number_of_trials);
anthitetic_results = zeros(1,number_of_trials);
anthitetic_v_n = zeros(1,number_of_trials);


for i=1:1:number_of_trials
    fprintf('Performing trial %s \n',  num2str(i));
    [crude_results(i), crude_v_n(i)] =  crude(fun, number_of_points, limits);
    [hit_or_miss_results(i), hit_or_miss_v_n(i)] = hit_or_miss(fun, number_of_points, limits);
    [stratified_equal_window_results(i) , stratified_equal_window_v_n(i)] = stratified_sampling(fun, number_of_points, [0 0.5; 0.5 1]);
    [stratified_custom_window_results(i), stratified_custom_window_v_n(i)] = stratified_sampling(fun, number_of_points, [0 2/3; 2/3 1]);
    [importance_results(i), importance_v_n(i)] = importance_sampling(number_of_points, limits,@(v) v.^(1/3) , 1/3, fun);
    [anthitetic_results(i), anthitetic_v_n(i)] = anthitetic_variates(fun, number_of_points, limits);
end

fprintf('Crude method:                       result: %s Standard deviation: %s sigma: %s \n', num2str(mean(crude_results)), num2str(std(crude_results)), num2str(sqrt(mean(crude_v_n)/number_of_trials)));
fprintf('Hit or miss method:                 result: %s Standard deviation: %s sigma: %s \n', num2str(mean(hit_or_miss_results)), num2str(std(hit_or_miss_results)), num2str(sqrt(mean(hit_or_miss_v_n)/number_of_trials)));
fprintf('Stratified method [0 0.5, 0.5 1] :  result: %s Standard deviation: %s sigma: %s \n', num2str(mean(stratified_equal_window_results)), num2str(std(stratified_equal_window_results)), num2str(sqrt(mean(stratified_equal_window_v_n)/number_of_trials)));
fprintf('Stratified method [0 0.66, 0.66 1]: result: %s Standard deviation: %s sigma: %s \n', num2str(mean(stratified_custom_window_results)), num2str(std(stratified_custom_window_results)), num2str(sqrt(mean(stratified_custom_window_v_n)/number_of_trials)));
fprintf('Importance sampling method:         result: %s Standard deviation: %s sigma: %s \n', num2str(mean(importance_results)), num2str(std(importance_results)), num2str(sqrt(mean(importance_v_n)/number_of_trials)));
fprintf('Anthitetic cariates method:         result: %s Standard deviation: %s sigma: %s \n', num2str(mean(anthitetic_results)), num2str(std(anthitetic_results)), num2str(sqrt(mean(anthitetic_v_n)/number_of_trials)));


results = [
    {crude_results, 'Crude'};
    {hit_or_miss_results, 'Hit or miss'};
    {stratified_equal_window_results, 'Stratified sampling - equal windows'};
    {stratified_custom_window_results, 'Stratified sampling - custom window'};
    {importance_results, 'Importance sampling'};
    {anthitetic_results, 'Anthitetic'};
];

for i=1:length(results)
    figure1 = figure;
    axes1 = axes('Parent',figure1);
    histogram(results{i,1},'DisplayName',results{i,2},'Normalization','probability');
    xlim([0.2 0.3]);
    legend(axes1,'show');
    xlabel('I_n');
    ylabel('P(I_n)');
    saveas(figure1,[results{i,2},'.png'])
end
