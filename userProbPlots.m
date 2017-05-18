%USERPROBPLOTS prints a list of possible probability plots, accepts a
%vector of the menu options, then displays the specified plots of userFile.

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

function []=userProbPlots(userFile)

%Printing menu
fprintf('\nProbability Plot Options:\n')
fprintf('     1 - Exponential\n')
fprintf('     2 - Extreme Value\n')
fprintf('     3 - Half Normal\n')
fprintf('     4 - Lognormal\n')
fprintf('     5 - Normal\n')
fprintf('     6 - Rayleigh\n')
fprintf('     7 - Weibull\n\n')

%User input
fprintf('Enter the menu options you want to plot. Maximum of 7 plots.\n')
try
plotSelection=input('Enter choices as a vector i.e. [1,2,3]\n');
catch
    fprintf('Not a valid input. Input set to [4,5]\n')
    plotSelection=[4,5];
end
%Testing for valid input
if isvector(plotSelection)
    if any(userFile<0)
        fprintf(['File contains negative values. Some plots may'...
            ' not be plotted (if any).\n'])
        plotSelection(plotSelection==1)=[];
        plotSelection(plotSelection==6)=[];
        plotSelection(plotSelection==7)=[];
    end
    plotSelection=sort(plotSelection);
    plotSelection=round(plotSelection);
    plotSelection(plotSelection>7)=[];
    plotSelection(plotSelection<1)=[];
    %Programmed to plot 7 plots at most. Simply a screen space/readibility
    %issue
    if length(plotSelection)>7
        fprintf(['Selection higher than 7. Reducing selection to 7 v'...
            'alues.\n'])
        plotSelection=plotSelection(1:7);
    end
    if isempty(plotSelection)
        fprintf('No valid inputs were read.\n')
        fprintf('Input set to [4,5]\n')
        plotSelection=[4,5];
    end
else
    fprintf('No valid inputs were read.\n')
    fprintf('Input set to [4,5]\n')
    plotSelection=[4,5];
end
%Plotting data
menuOptions={'exponential','ev','hn','lognormal','normal',...
    'rayleigh','wbl'};
plotTitles={'Exponential','Extreme Value','Half Normal',...
    'Lognormal','Normal','Rayleigh','Weibull'};
%Holds text values for all possible probplot label types
hold on
for i=1:length(plotSelection)
    subplot(1,length(plotSelection),i)
    probplot(menuOptions{plotSelection(i)},userFile)
    title(plotTitles{plotSelection(i)})
end
fprintf('Plotting data. This may take some time.\n')
end