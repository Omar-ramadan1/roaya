const mongoose = require('mongoose');

const auth = mongoose.Schema({
    name: String,
    email:String,
    password: String,
    type: String,
    budget:Number
});

module.exports = mongoose.model("AUTH",auth);