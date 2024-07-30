# Usage
## Download files
Download the files to install Docker images later.
```
sudo wget https://github.com/SchBenedikt/easy-docker/tree/main/sch.sh
sudo chmod +x sch.sh
```
## Running a Docker image
Image: dash.
```
./sch.sh install dash.
```
# Create your own script
You can write any .sh script you like. This will then be executed when you 
```
./sch.sh install FOLDER_NAME
```
in the terminal.
The FOLDER_NAME must be in lower case, the corresponding script file (script.sh) must have the same name as the FOLDER_NAME.
Here you can perform installations of Docker images or other things.
