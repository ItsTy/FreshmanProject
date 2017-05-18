function []=summaryStats(userFile,myFile)
%SUMMARYSTATS prints the summary statistics of the input file


% By submitting this assignment, I agree to the following:
%  "Aggies do not lie, cheat, or steal, or tolerate those who do"
%  "I have not given or received any unauthorized aid on this assignment"
%
% Name:       Tyler Harmon
% Section:     526
% Team:        18
% Assignment:  MATLAB Coding Project
% Date:        3/12/17

fprintf(myFile,'Mean   = %8.3f\n',mean(userFile));
fprintf(myFile,'Median = %8.3f\n',median(userFile));
fprintf(myFile,'Mode   = %8.3f\n',mode(userFile));
fprintf(myFile,'Var    = %8.3f\n',var(userFile));
fprintf(myFile,'Stdev  = %8.3f\n',std(userFile));
fprintf(myFile,'Min    = %8.3f\n',min(userFile));
fprintf(myFile,'Max    = %8.3f\n',max(userFile));
fprintf(myFile,'Count  = %8d\n',length(userFile));

end