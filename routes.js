var mongoose = require('mongoose');

// import controllers

module.exports = function(app) {
    app.get("/", function(req, res) {
       res.render('index'); 
    });

};