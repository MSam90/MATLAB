% *********************************************** %
%               Mohamed Abou Samak                %
%                    1.2                          %
% *********************************************** %

clc
clear

matM = [  3  4  5  2  3  6  ;                       % Declares matrix matM and sets the variables
         23 95 23  0 29 39  ;
         23 64 72 41  8 91  ;
         47 28 31 62 84 23  ;
         28 40 39 45 54 59 ];

inpV = 23;                                          % Input value to be located

c = Q1x2x(matM,inpV);                               % This is the call for the function
                                                    % specifying the output location C and 
                                                    % the input variables matM and inpV
                                      
celldisp(c);                                        %Displays the cell array contents

function z = Q1x2x(x,y)

    [row,column] = find(x == y);                    % Locates the row and columns of input number
    minRow = min(row);
    columnIndex = minRow == row;
    column = column(columnIndex);
    if minRow < 2
        rowIndex = row(minRow);
        z = {x(1:rowIndex,1:column),                % Specifies the values in the first cell
            x(rowIndex+1:end,column+1:end)};        % In the second cell
    else
        z = {x(1:minRow,1:column),                  % Specifies the values in the first cell
            x(minRow+1:end,column+1:end)};          % In the second cell    
    end
                   
               

end

