# Bash File Creator 🪄

The script that creates a new empty bash file with hashbang e makes it executable.

## How it works ⚙️

The script requires to user the following parameters:

- name of file

The script accepts multiple file name as arguments and creates a new file ready to be edit and writes in the hashbang e makes it executable only by the owner.

It can creates as many files as many given names. 

## How to use it 🚀

1. Make it executable   `chmod +x bashfile.sh` 
2. Execute the script   `./bashfile.sh arg1 arg2...`

## Why this script? 💡
Because it can makes this operation faster then manually create single or multiple new bash files.

## Flowchart
```mermaid

flowchart TD

%% Classes Def %%
    classDef default color:#fff;
    classDef process fill:#0000ff,stroke:#cc9900,stroke-width:0px;
    classDef error fill:#ff0000,stroke:#cc9900,stroke-width:0px;
    classDef condition fill:#d10061,stroke:#cc9900,stroke-width:0px;
    


         START((Start))
         -->argsNumbber{input arguments = 0 ?}:::condition
            --YES-->error[Write an error message <br>on stdout]:::process-->exit[Exit on <br>error status]:::error-->stop
            
        argsNumbber --NO-->forcycle{There are arguments in $@?}:::condition
        forcycle--NO-->stop((END))

        argExists--NO-->createFile[Create a new File <br>from given argument]-->hashbang[Write in it the hasbang]-->makexec[make it executable <br>only by owner]-->infomsg[Write success message on stdout]-->forcycle

        forcycle--YES-->argExists{file as argument <br>already exists?}:::condition --YES-->error2[Write an error message in stdout]:::process-->forcycle
 
```