% *********************************************** %
%               Mohamed Abou Samak                %
%                    1.1.2                        %
% *********************************************** %

clc
clear

a = [4 1 3 2 1 0 2 1 4 0];  % Vector Initialization and value declaration

aMean = mean(a);            % Mean value of A

b = find(a > aMean);        % Finds the indeces of value greater than mean of A

c = a(b)                    % Prints the values greater than mean of A
