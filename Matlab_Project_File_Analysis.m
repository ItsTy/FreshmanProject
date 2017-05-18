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

%Load, manipulate, and process data from a specified file, as determined by
%the user.
DONE=false;
while DONE==false
    %Runs code continuously until user chooses to exit
    clc
    %Clears text from the command window to avoid large scroll
    printMenu()
    %Displays all possible menu options. Each action has an associated
    %numerical value.
    selection=input(['To choose an option, enter the corresponding '...
       'number.\n'],'s');
    %Stores user menu choice to determine which which task to run.
    
    switch str2double(selection)
        %Set Username
        case 1
            if exist('username','var')
                %Checks whether or not the variable 'username' exists and
                %would be overwritten
                fprintf(['Username already set as %s. Would you like to'...
                    ' overwrite?\n'],username)
                tfOverwrite=input('Enter Y/N.\n','s');
                %True/False Overwrite
                %Lets user decide whether or not to overwrite the username
                tfOverwrite=lower(tfOverwrite);
                %Lets the program read the user input regardless of case
                if tfOverwrite=='y'
                    username=input('Enter username.\n','s');
                    fprintf('Username set as %s.\n',username)
                elseif tfOverwrite=='n'
                    fprintf('Username set as %s.\n',username)
                else
                    fprintf('Not a valid input. Returning to menu.\n')
                end
            else
                username=input('Enter username.\n','s');
                fprintf('Username is %s.\n',username)
            end

        %Load Data File
        case 2
            if exist('dataFilename','var')
                %Checks if another file is already written to the workspace
                fprintf('The file ''%s'' has already been selected.\n',...
                    dataFilename)
            else
                dataFilename=input('Enter the name of the file.\n','s');
                %Inputs the user's filename for loading
                if length(dataFilename)<4
                    dataFilename=[dataFilename,'    '];
                    %A valid filename will always be at least 4 characters
                    %('.txt'). This is for checking validity below
                end
                if exist(dataFilename,'file')...
                        &&(strcmp(dataFilename(end-3:end),'.txt'))
                    %Checks that the file actually exists
                    try
                        userFile=loadNewFile(dataFilename);
                    catch
                        fprintf(['Something was wrong with your file. M'...
                            'ake sure it is only numeric values.\n'])
                        clear dataFilename
                    end
                    if isempty(userFile)
                        fprintf('File is empty. Select a different file.\n')
                        clear userFile dataFilename
                    end
                    if exist('userFile','var')
                        matrixDimensions=size(userFile);
                        if matrixDimensions(2)>1
                            fprintf('Concatenating first two columns.\n')
                            userFile=[userFile(:,1)',userFile(:,2)'];
                        end
                        fprintf('%s has been set as the current file.\n'...
                            ,dataFilename)
                        n=length(userFile);
                        %Number of observations determines use of standard
                        %deviation versus standard error
                        if n<30
                            largePopulation=false;
                        else
                            largePopulation=true;
                        end
                        %Used for probability calculations
                        fprintf('\nMean   = %8.3f\n',mean(userFile));
                        fprintf('Median = %8.3f\n',median(userFile));
                        fprintf('Mode   = %8.3f\n',mode(userFile));
                        fprintf('Var    = %8.3f\n',var(userFile));
                        fprintf('Stdev  = %8.3f\n',std(userFile));
                        fprintf('Min    = %8.3f\n',min(userFile));
                        fprintf('Max    = %8.3f\n',max(userFile));
                        fprintf('Count  = %8d\n\n',length(userFile));
                    end
                else
                    fprintf(['File ''%s'' does not appear in the curren'...
                        't directory or is not a .txt file'...
                        '.\n'],dataFilename)
                    clear dataFilename
                end
            end

        %Clear Data from Memory
        case 3
            if exist('userFile','var')
                fprintf('Are you sure you want to clear data?\n')
                tfOverwrite=input('Enter Y/N.\n','s');
                %Lets user decide whether or not to overwrite the file in
                %memory
                tfOverwrite=lower(tfOverwrite);
                %Lets the program read the user input regardless of case
                if tfOverwrite=='y'
                    clear userFile X Z xProb zProb i largePopulation
                    if exist('dataFilename','var')
                        clear dataFilename
                        fprintf('Data has been cleared.\n')
                    end
                elseif tfOverwrite=='n'
                    fprintf('Data has not been cleared.\n')
                else
                    fprintf('Not a valid input. Returning to menu.\n')
                end
            else
                fprintf('There is no data file in memory.\n')
            end

        %Set Output Filename
        case 4
            if exist('writeFilename','var')
                fprintf(['The filename is already set as ''%s''. Do you'...
                    ' want to change it?\n'],writeFilename)
                tfOverwrite=input('Enter Y/N.\n','s');
                %Lets user decide whether or not to change the filename
                tfOverwrite=lower(tfOverwrite);
                %Lets the program read the user input regardless of case
                if tfOverwrite=='y'
                    rename_file=true;
                    oldname=writeFilename;
                elseif tfOverwrite=='n'
                    rename_file=false;
                else
                    fprintf('Not a valid input. Returning to menu.\n')
                    rename_file=false;
                end
            else
                rename_file=true;
            end

            if rename_file
                writeFilename=input(['Enter a name for the write fi'...
                    'le name.\n'],'s');

                if length(writeFilename)>=4
                    if ~strcmp(writeFilename(end-3:end),'.txt')
                        fprintf('Saving as a .txt file.\n')
                        writeFilename=[writeFilename,'.txt'];
                        %Ensures file ends in .txt
                    end
                else
                    writeFilename=[writeFilename,'.txt'];
                end
                
                if exist(writeFilename,'file')
                    fprintf(['File already exists with that name. Do y'...
                        'ou wish to overwrite?\n'])
                    tfOverwrite=input('Enter Y/N.\n','s');
                    %Lets user decide whether or not to change the filename
                    tfOverwrite=lower(tfOverwrite);
                    %Lets the program read the input regardless of case
                    if tfOverwrite=='n'
                        if exist(oldname,'var')
                            writeFilename=oldname;
                        end
                    elseif tfOverwrite=='y'
                    else
                        fpritnf('Not a valid input.\n')
                    end
                end
            end
            fprintf('Write file name set as ''%s''.\n',writeFilename)

        %Plot Histogram
        case 5
            try
                hist(userFile)
                title('Histogram of Loaded File')
                fprintf('Plotting data. This may take some time.\n')
            catch
                fprintf('No file loaded to memory.\n')
            end

        %Plot Histogram Fit
        case 6
            try
                histfit(userFile)
                title('Histogram Fit of Loaded File')
                fprintf('Plotting data. This may take some time.\n')
            catch
                fprintf('No file loaded to memory.\n')
            end

        %Plot Probability Plots
        case 7
            try
                userProbPlots(userFile)
            catch
                fprintf('No file stored in memory.\n')
            end
           
        %Probability Given x or z
        case 8
            fprintf('In your opinion, is the data normally distributed?\n')
            tfOverwrite=input('Enter Y/N.\n','s');
                %Lets user decide yes or no
                tfOverwrite=lower(tfOverwrite);
                %Lets the program read the user input regardless of case
                if tfOverwrite=='y'
                    normallyDistributed=true;
                    %Recorded on output file
                    fprintf(['Would you like to use x or z for probabi'...
                        'lity calculations?\n'])
                    x_z_option=lower(input('Enter x/z.\n','s'));
                 switch lower(x_z_option)
                        case 'x'
                            if exist('userFile','var')
                                userStDev=std(userFile);
                                if ~largePopulation
                                    userStDev=userStDev/sqrt(n);
                                end
                                if ~exist('X','var')
                                    X=struct('x1',0,'x2',0,'p',0);
                                end
                                userMean=mean(userFile);
                                X=userProbsX(userStDev,userMean,X);
                            else
                                fprintf('File must be loaded to memory.\n')
                            end
                        case 'z'
                            userStDev=1;
                            userMean=0;
                            %Normal distribution for a Z table.
                            if ~exist('Z','var')
                                Z=struct('x1',0,'x2',0,'p',0);
                            end
                            Z=userProbsX(userStDev,userMean,Z);
                     otherwise
                            fprintf('Not a valid input.\n')
                 end
                 elseif tfOverwrite=='n'
                    normallyDistributed=false;
                    fprintf(['Data must be normally distributed to use '...
                        'Z.\n'])
                else
                    fprintf('Not a valid input. Returning to menu.\n')
                end
        %X or Z Given Probability
        case 9
            fprintf('In your opinion, is the data normally distributed?\n')
            tfOverwrite=input('Enter Y/N.\n','s');
                %Lets user decide yes or no
                tfOverwrite=lower(tfOverwrite);
                %Lets the program read the user input regardless of case
                if tfOverwrite=='y'
                    normallyDistributed=true;
                    %Recorded on output file
                    fprintf(['Would you like to use x or z for probabi'...
                        'lity calculations?\n'])
                    x_z_option=lower(input('Enter x/z.\n','s'));
                 switch lower(x_z_option)
                        case 'x'
                            if exist('userFile','var')
                                userStDev=std(userFile);
                                if ~largePopulation
                                    userStDev=userStDev/sqrt(n);
                                end
                                userMean=mean(userFile);
                                if ~exist('xProb','var')
                                    xProb=struct('p',0,'x',0);
                                end
                                xProb=invProbsX(userStDev,userMean,xProb);
                            else
                                fprintf('File must be loaded to memory.\n')
                            end
                        case 'z'
                            userStDev=1;
                            userMean=0;
                            %Normal distribution for a Z table.
                            if ~exist('zProb','var')
                                zProb=struct('p',0,'x',0);
                            end
                            zProb=invProbsX(userStDev,userMean,zProb);
                     otherwise
                            fprintf('Not a valid input.\n')
                 end
                 elseif tfOverwrite=='n'
                    normallyDistributed=false;
                    fprintf(['Data must be normally distributed to use '...
                        'Z.\n'])
                else
                    fprintf('Not a valid input. Returning to menu.\n')
                end
        %Displays Summary Statistics
        case 10
            if exist('userFile','var')
                fprintf('\nMean   = %8.3f\n',mean(userFile));
                fprintf('Median = %8.3f\n',median(userFile));
                fprintf('Mode   = %8.3f\n',mode(userFile));
                fprintf('Var    = %8.3f\n',var(userFile));
                fprintf('Stdev  = %8.3f\n',std(userFile));
                fprintf('Min    = %8.3f\n',min(userFile));
                fprintf('Max    = %8.3f\n',max(userFile));
                fprintf('Count  = %8d\n\n',length(userFile));
            else
                fprintf('No file loaded to memory.\n')
            end
        %End Program
        case 11
            DONE=true;
            %Cancels the while loop
            
            %Writing data to specified text file
            fprintf('Writing to data file\n')
            try
                myFile=fopen(writeFilename,'wt+');
            catch
                fprintf(['No output filename set. Data will not be '...
                    'saved.\n'])
                fprintf('Would you like to return to the menu?\n')
                tfOverwrite=input('Enter Y/N.\n','s');
                %Lets user decide whether or not to return to the menu
                tfOverwrite=lower(tfOverwrite);
                %Lets the program read the user input regardless of case
                if tfOverwrite=='y'
                    DONE=false;
                elseif tfOverwrite=='n'
                else
                    fprintf('Not a valid input. Returning to menu.\n')
                    DONE=false;
                end
            end
            
            try
                if exist('dataFilename','var')
                    fprintf(myFile,'Data File: %s\n',dataFilename);
                end
                
                fprintf(myFile,'%s\n',date);
                
                if exist('writeFilename','var')
                    fprintf(myFile,'User: %s\n',username);
                end
                
                if exist('userFile','var')
                    fprintf('Writing summary statistics to file.\n')
                    summaryStats(userFile,myFile)
                end
                
                if exist('largePopulation','var')
                    if largePopulation
                        fprintf(myFile,'n>=30\n');
                    else
                        fprintf(myFile,'n<30\n');
                    end
                end
                
                if exist('normallyDistributed','var')
                    if normallyDistributed
                        fprintf(myFile,'Normally distributed\n');
                    else
                        fprintf(myFile,'Not normally distributed\n');
                    end
                end
                
                if exist('X','var')
                    fprintf(myFile,'Probability Given X:\n');
                    probs2file(X,myFile)
                end
                
                if exist('Z','var')
                    fprintf(myFile,'Probability Given Z:\n');
                    probs2file(Z,myFile)
                end
                
                if exist('xProb','var')
                    fprintf(myFile,'X Given Probability:\n');
                    X_Z_2_file(xProb,myFile)
                end
                
                if exist('zProb','var')
                    fprintf(myFile,'Z Given Probability:\n');
                    X_Z_2_file(zProb,myFile)
                end
                
                try
                    isClosed=fclose(myFile);
                catch
                end
                
            catch

            end
            
            if DONE
                clear dataFilename userFile writeFilename username myFile
                clear normallyDistributed oldname userMean userStDev
                clear selection tfOverwrite x_z_option X Z xProb zProb i
                clear largePopulation matrixDimensions n rename_file
                %Clears certain variables that would cause problems if the
                %program is run again immediately after termination
                fprintf('Analysis Terminated\n')
            end
                
        otherwise
            fprintf('Your choice was not one of the menu options.\n')

    end
    if ~DONE
        fprintf('Returning to menu. Press any key to continue.\n')
        pause()
        %Gives time to display output of any actions taken before displaying
        %menu.
    end
end