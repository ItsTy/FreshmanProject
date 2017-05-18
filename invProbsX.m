function [xProb]=invProbsX(userStDev,userMean,xProb)
%INVPROBSX calculates x or z values that correspond to input probability.
%Uses standard deviation and mean of the user file for x or 1 and 0,
%respectively, for z.

% By submitting this assignment, I agree to the following:
%  "Aggies do not lie, cheat, or steal, or tolerate those who do"
%  "I have not given or received any unauthorized aid on this assignment"
%
% Name:       Tyler Harmon
% Section:     526
% Team:        18
% Assignment:  MATLAB Coding Project
% Date:        3/12/17

fprintf(['Enter a string, negative value, or a value greater than 1'...
    ' to quit calculations.\n'])
i=1;
%Index for storing data that will be written to file
DONE=false;
while DONE==false
    p=str2double(input('Enter a value.\n','s'));
    %Probability value
    if isnan(p)||p<0||p>1
        %Probability must be between 0 and 1
        fprintf('Probability calculations terminated.\n')
        DONE=true;
    else
        x_z_Value=norminv(p,userMean,userStDev);
        xProb.p(i)=p;
        xProb.x(i)=x_z_Value;
        %Stores inputs and calculations for writing to the file.
        i=i+1;
        %Incrementing the index since the number of calculations the user
        %will perform is not specified
        fprintf('Corresponding value for p = %f: %f\n',p,x_z_Value)
        pause(1)
    end
end
end