var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var {placeholder}Schema = new Schema({
    some_attribute: {
        type: String,
        required: [true, "Message"]
    },
    some_other_attribute: {
        type: Number,
        required: false
    }
}, {timestamps: true});

var {placeholder} = mongoose.model("{placeholder}", {placeholder}Schema);