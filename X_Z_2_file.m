function []=X_Z_2_file(xProb,myFile)
%X_X_2_FILE writes data from norminv calculations to data file. xProb is a
%structure storing x and p values, calculated from invProbsX, and myFile is
%the file to which data is written.


% By submitting this assignment, I agree to the following:
%  "Aggies do not lie, cheat, or steal, or tolerate those who do"
%  "I have not given or received any unauthorized aid on this assignment"
%
% Name:       Tyler Harmon
% Section:     526
% Team:        18
% Assignment:  MATLAB Coding Project
% Date:        3/12/17

for i=1:length(xProb.p)
    fprintf(myFile,'Corresponding value for p = %f: %f\n',xProb.p(i)...
        ,xProb.x(i));
end
end