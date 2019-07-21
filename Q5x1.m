% *********************************************** %
%               Mohamed Abou Samak                %
%                       5.1                       %
% *********************************************** %

clc
clear

% *********************************************** %

samples = 300;                      % sample number
timeVector_1 = zeros(samples,1);
timeVector_2 = zeros(samples,1);
variance_1 = 0;
alpha = 1.960;                      % alpha for 95% confidence interval



% time samples obtained within the matrix generation loop.

for n = 1 : samples
    r = randi(10,800,800);
    tic
    inv(r);
    timeVector_1(n,1) = toc;
end



timeVector_1 = timeVector_1*1000;   % multiplication to obtain data in milliseconds
variance = var(timeVector_1);
standard = std(timeVector_1);
mean_1 = mean(timeVector_1);        % mean values for the time vector

% variance calculations

mean_1 = mean(timeVector_1);                        % mean values for the time vector
timeVector_2 = timeVector_1 - mean_1;               % Subtract the mean from all time observations
timeVector_2 = timeVector_2.^2;                     % Square all time observations
variance_sum = sum(timeVector_2);                   % sumation of all observations
variance_1 = (variance_sum/length(timeVector_2));   % divide by the number of observations

% standard deviation
sigma_1 = sqrt(variance_1);

% Confidence interval at 95% for the mean run time with alpha of 1.960 for
% the t table

confInterval_1 = [(mean_1 - alpha * (sigma_1/sqrt(samples))),
    (mean_1 + alpha * (sigma_1/sqrt(samples)))];

% Histogram plots for matrix samples vs time (milliseconds)

figure(1)
hist(timeVector_1,10);
xlabel('Time (ms)')
ylabel('Matrices')
xlim([10 25])
ylim([0 300])
