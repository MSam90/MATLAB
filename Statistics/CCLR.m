% *********************************************** %

%               Mohamed Abou Samak                %

%              Correlation Coefficient            %
                  Linear Regression
% *********************************************** %



clc

clear



% *********************************************** %



ns = 300;                       % ns is the number of samples

timeMatrix_1 = zeros(ns,1);     % will be used the genereation loop

                                % loop

timeMatrix_2 = zeros(ns,1);     % will be used in a separate loop                        

matrixSizes = zeros(ns,1);      % will be used to document the matrix sizes

matrixContainer = cell(ns,1);   % will hold the 



% time samples obtained within the matrix generation loop.



for n = 1 : ns

    x = randi([500, 1000]);

    matrixSizes(n) = x;

    r = randi(10,x,x);

    tic;

    rx = inv(r);

    timeMatrix_1(n) = toc;

end



% multiplication to obtain time in milliseconds



timeMatrix_1 = timeMatrix_1 * 1000;



% new definitions for the purpose of calculations



x_1 = timeMatrix_1;

y = matrixSizes;



% Further calculations



xpow_1 = x_1.^2;

xy_1 = x_1.*y;

ypow = y.^2;



% sum variables of data vectors



x1_sum = sum(x_1); 

xpow_sum1 = sum(xpow_1);

xy_sum1 = sum(xy_1);

ypow_sum = sum(ypow);

y_sum = sum(y);



% sample correlation coefficient



scc_1 = (ns*(xy_sum1)-((x1_sum)*(y_sum)))/sqrt((ns*(xpow_sum1)-(x1_sum)^2)*(ns*(ypow_sum)-(y_sum)^2));

scc_2 = corrcoef(timeMatrix_1,matrixSizes);



figure(1)

scatter(timeMatrix_1,matrixSizes,'b','x');

r = lsline;

set(r,'color','r')

xlabel('Time (ms)')

ylabel('Matrix Sizes')

xlim([0 35])

ylim([500 1000])

legend('Matrices','Regression')
