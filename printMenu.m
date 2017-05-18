%PRINTMENU  displays the numbered list of possible actons for the user.

% By submitting this assignment, I agree to the following:
%  "Aggies do not lie, cheat, or steal, or tolerate those who do"
%  "I have not given or received any unauthorized aid on this assignment"
%
% Name:       Tyler Harmon
% Section:     526
% Team:        18
% Assignment:  MATLAB Coding Project
% Date:        3/12/17
%

function []=printMenu()
%PRINTMENU displays menu options for working with the data file.
    fprintf('\nOptions:\n')
    fprintf('     1 - Set Username\n')
    fprintf('     2 - Load Data File\n')
    fprintf('     3 - Clear Data File from Memory\n')
    fprintf('     4 - Set Output Filename\n')
    fprintf('     5 - Plot Histogram\n')
    fprintf('     6 - Plot Histogram Fit\n')
    fprintf('     7 - Plot Probability Plots\n')
    fprintf('     8 - Probability of X or Z Range\n')
    fprintf('     9 - Find x or z for a Specific Probability\n')
    fprintf('    10 - Display Summary Statistics\n')
    fprintf('    11 - Exit\n\n')
end