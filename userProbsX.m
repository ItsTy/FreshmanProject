function [X]=userProbsX(userStDev,userMean,X)
%USERPROBSX takes x pr z values from the user and displays the probability
%of that value.

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

fprintf('Enter a string to quit calculations.\n')
i=1;
%Index for storing data
DONE=false;
while DONE==false
    x=[0,0];
    x(1)=str2double(input('Enter a value.\n','s'));
    x(2)=str2double(input('Enter another value.\n','s'));
    if isnan(x(1))||isnan(x(2))
        fprintf('Probability calculations terminated.\n')
        DONE=true;
    else
        prob1=normcdf(x(1),userMean,userStDev);
        %Lower bound
        prob2=normcdf(x(2),userMean,userStDev);
        %Upper bound
        probRange=abs(prob2-prob1);
        %Probability must be positive
        
        %Storing data to print to file
        x=sort(x);  
        X.x1(i)=x(1);
        X.x2(i)=x(2);
        X.p(i)=probRange;
        i=i+1;
        %Incrementing the index since the number of calculations the user
        %will perform is not specified
        
        fprintf(['Probability that x lies within %.3f and %.3f '...
            'is %f\n'],x(1),x(2),probRange)
        pause(1)
    end
end

end