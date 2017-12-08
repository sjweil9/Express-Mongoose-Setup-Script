# Express-Mongoose-Setup-Script
A quick script for setting up an express/mongoose app

## How to use:
- put .js files into a "default_project" folder somewhere appropriate, change path/to/default/project in script to that directory
- move express.sh to your /usr/local/bin
- chmod +x express.sh to give it executable permission
- navigate to a directory in which you would like to create your project
- project="your_project_name" express.sh model_name other_model_name

## Other notes:
- written assuming MacOS, but using gnu-sed (brew install gnu-sed) - if using Linux, change gsed to sed
- your_project_name will be both the name of the directory that is created and the name of the Mongo database that will be used
- type model_name as lowercase and singular
- you can add any number of model names, all relevant model files and controllers will be added and required by the appropriate files
- change the package.json as necessary to include or remove any modules needed for your project
