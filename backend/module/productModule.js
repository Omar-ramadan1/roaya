const mongoose = require('mongoose');

module.exports =
 products = mongoose.Schema({
    name:String,
    price:Number,
    desc:String,
    quantity:Number,
    //image :String,
})

module.exports = mongoose.model('PRODUCTS',products);