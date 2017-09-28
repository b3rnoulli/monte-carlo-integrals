# monte-carlo-integrals

Matlab scripts for solving 1D integrals using following methods:
* crude monte carlo
* hit or miss
* stratified sampling
* importance sampling
* anthitetic sampling

Below re

## Results

Integral ```x^3 ``` in limits from ```0``` to ```1``` was solved using mentioned MC methods. Each integral was calculated 10000 times for 2000 points.

### Crude method

![alt tag](https://raw.github.com/b3rnoulli/monte-carlo-integrals/master/pictures/Crude.png)

### Hit or miss method
![alt tag](https://raw.github.com/b3rnoulli/monte-carlo-integrals/master/pictures/Hit_or_miss.png)

### Stratified sampling method - equal windows
![alt tag](https://raw.github.com/b3rnoulli/monte-carlo-integrals/master/pictures/Stratified_sampling_equal_windows.png)

### Stratified sampling method - custom windows
![alt tag](https://raw.github.com/b3rnoulli/monte-carlo-integrals/master/pictures/Stratified_sampling_custom_window.png)

### Importance sampling method - sampling function 
![alt tag](https://raw.github.com/b3rnoulli/monte-carlo-integrals/master/pictures/Importance_sampling.png)

### Anthitetic sampling method 
![alt tag](https://raw.github.com/b3rnoulli/monte-carlo-integrals/master/pictures/Anthitetic.png)


## Results summary

| Method  | Result | Standard deviation | Sigma | 
| ------------- | ------------- | ------------- | ------------- |
| Crude  | 0.24993 | 0.0062573 | 0.0028337 |
| Hit or miss  | 0.24998 | 0.0096738 | 0.0043289 | 
| Stratified sampling - equal window  | 0.24998 | 0.0040786 | 2.0156e-05 |
| Stratified sampling - custom window | 0.24997 | 0.0030311 | 1.3449e-05 |
| Importance sampling  | 0.25001 | 0.0014414 | 0.0006451 |
| Anthitetic sampling  | 0.25006 | 0.0035233 | 0.0029586 |


