const mongoose = require('mongoose');

module.exports =
    products = mongoose.Schema({
        name: String,
        price: Number,
        desc: String,
        imageURL: String,
        teacherId: String
    })

module.exports = mongoose.model('PRODUCTS', products);