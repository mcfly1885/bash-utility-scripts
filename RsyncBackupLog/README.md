# Rsync Backup Log 📂
The script that backups file or directory with rsync and writes a log file.

## How it works ⚙️

The script executes a backup of a file or directory from given SOURCE path to given DESTINATION path. Each operation (info, warning or error) is written in a log txt file. If quiet mode is enabled no log file will be use.

## Requirements 🛠️
Make sure that on your system is installed: 
```
 rsync 
 realpath
 ```

## Parameters 📋

|Parameter|Description|
|---------|-----------|
|-s| the source path of file or directory to backup. If the source path point to a symLink, rsync will backup the actual file by following the symlink path.
|-d| the destination path where to save the backup, it must be a directory|
|-l|the log file path, it must be a txt file. If the file doesn't exist on the given path a new one is created|
|-q| enable quiet mode, no log file will be use|



## Log 📄
The log messages include timestamp and are of three categories:

|Category| Description |
|----------|-------------|
|INFO| message that reports an operation executed with success|
|WARNING| message that reports a failed operation but the script can continue|
|ERROR| message that reports a failed operation and script exits on error status.




## Hint 💡
This script is designed to work with **cron**. If you want to set a crontab, remember to use absolute paths.

## How to use it 🚀
1. Make it executable: `chmod +x rsyncbakuplog.sh` 
2. Execute the script like in the following example:

`./rsyncbakuplog.sh -s path/to/yourfile.txt -d path/to/backupdir -l path/to/logfile.txt`

if you want to enable quiet mode

`./rsyncbakuplog.sh -s path/to/yourfile.txt -d path/to/backupdir -q`

## Be carful! ⚠️
**This script work with files and directories. Make sure that you know what are you doing**.

## Flowchart
```mermaid
flowchart TD

%% Classes Def %%
    classDef default color:#fff;
    classDef process fill:#0000ff,stroke:#cc9900,stroke-width:0px;
    classDef error fill:#ff0000,stroke:#cc9900,stroke-width:0px;
    classDef condition fill:#d10061,stroke:#cc9900,stroke-width:0px;


         START((Start))
        --> Readparam[Read Param<br>and Flags]:::process
        --> isNotQuite{is quite mode <b>NOT</b> enable?}:::condition

    isNotQuite --YES--> logpathempty{is log path empty?}:::condition
    isNotQuite --NO--> isSouceEmpty
    %%Log Path is empty%%
    logpathempty --YES--> error[Write error message<br> on stdout]:::process --> e[Exit on error status 1]:::error ---->endscript
    logpathempty --NO--> logfileExists{Does log file exist <br>on given path?}:::condition
    %% log path exists %%
    logfileExists --YES--> isLogfile{Is not a file?}:::condition
    --YES-->error
        logfileExists --NO--> createFile[Create a new file]:::process
        ---> writemessage[Write a warning message<br>in log file]:::process
        --->isSouceEmpty
    isLogfile --NO--> isTxtfile{is not a txt file?}:::condition
        --YES--> error

        isTxtfile --NO--> isSouceEmpty{Is path to source file<br> empty?}:::condition
    %%Source File%%
        --YES-->errorlog[Write an error message in log file]:::process
        -->e
        isSouceEmpty --NO--> isDestinationEmpty{Is path to destination<br> empty?}:::condition
    %%Destination File%%
        isDestinationEmpty --YES-->errorlog
        isDestinationEmpty --NO--> destinationExists{Does not destination<br>exist?}:::condition
            destinationExists--YES-->errorlog
            destinationExists--NO-->isDestinationDir{is not destination <br>a directory?}:::condition
            isDestinationDir--YES-->errorlog
        %%Source Exists%%
            isDestinationDir--NO-->SourceExists{Does Surce file exist?}:::condition 
        SourceExists --NO-->errorlog
        SourceExists--YES--> isSymlink{is it a Symlink?}:::condition --YES--> execrsyncSymLink[execute rsync following <br>the symlink path]:::process-->writeinfolog
        isSymlink--NO-->isSourceAfile{Is it a file?}:::condition
        isSourceAfile --YES--> execrsync[execute rsync with <br>source and destination path]:::process
        --> writeinfolog[Write info message<br> in log]:::process ---> endscript((END))
        isSourceAfile --NO--> isSourceAdir{Is it a<br>directoty}:::condition
        isSourceAdir --YES-->execrsyncDir[execute rsync recursively<br> on source dir to destination]:::process -->writeinfolog   

    


```