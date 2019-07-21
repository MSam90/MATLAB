% *********************************************** %
%               Mohamed Abou Samak                %
%                    1.1.1                        %
% *********************************************** %

clc
clear

a = [4 1 3 2 1 0 2 1 4 0];      % Declare vector a and intialize variables

aMean = 0;                      % Holds the mean of vector a

b = zeros(0,0);                 % Declares a dynamic array of zeroes

c = zeros(0,0);                 

for x = 1: length(a)
    aMean = (aMean + a(x));
end

aMean = aMean/length(a);

for y = 1:length(a)
    if a(y) > aMean
        b =[b y];
        c = [c a(y)];
    end
end
