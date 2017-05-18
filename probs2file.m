function []=probs2file(X,myFile)
%PROBS2FILE writes probability data to file. X is the structure storing x
%values and the probability between each two user inputs. Written to myFile


% By submitting this assignment, I agree to the following:
%  "Aggies do not lie, cheat, or steal, or tolerate those who do"
%  "I have not given or received any unauthorized aid on this assignment"
%
% Name:       Tyler Harmon
% Section:     526
% Team:        18
% Assignment:  MATLAB Coding Project
% Date:        3/12/17

for i=1:length(X.x1)
    fprintf(myFile,['Probability that x lies within %.3f and %.3f '...
        'is %f\n'],X.x1(i),X.x2(i),X.p(i));
end
end