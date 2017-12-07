#!/bin/bash

mkdir $project
cd $project

mkdir client
cd client
mkdir static
mkdir views

cd ..
mkdir server
cp /path/to/Default_Project/server.js server.js
cp /path/to/Default_Project/package.json package.json
gsed -i "s/{placeholder}/$project/g" package.json

cd server
mkdir config
mkdir controllers
mkdir models

cd config
cp /path/to/Default_Project/mongoose.js mongoose.js
cp /path/to/Default_Project/routes.js routes.js
gsed -i "s/{placeholder}/$project/g" mongoose.js

for arg in $@
do
    plural=$arg's'
    gsed -i "/\/\/ import controllers/a\var $plural = require('../controllers/$plural.js');" routes.js
done

cd ../controllers

for arg in $@
do
    plural=$arg's'
    cap="$(echo $arg | gsed 's/.*/\u&/')"
    cp /path/to/Default_Project/controller.js $plural.js
    gsed -i "/\/\/ import models/a\var $cap = mongoose.model('$cap');" $plural.js
    if [ $arg = user ]
    then
        gsed -i "/\/\/ import packages/a\var bcrypt = require('bcrypt-as-promised');" $plural.js
    fi
done

cd ../models

for arg in $@
do
    cap="$(echo $arg | gsed 's/.*/\u&/')"
    cp /path/to/Default_Project/model.js $arg.js
    gsed -i "s/{placeholder}/$cap/g" $arg.js
done

cd ../../
npm install
