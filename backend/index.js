const express = require("express");
const mongoose = require('mongoose');
const app = express();
const productRoute = require('./route/ProductRoute');

const port =3000;

var bodyParser = require('body-parser');
const cors = require('cors');



mongoose.connect("mongodb+srv://roaya:roaya@cluster0.hakwt.mongodb.net/myFirstDatabase?retryWrites=true&w=majority",

{
    useNewUrlParser: true,
    useUnifiedTopology: true
}
    );
    const connection = mongoose.connection;
    connection.on('connected', () => { console.log("connect with cloud") });
    connection.on('error', () => { console.log("error with database") });
    app.use([bodyParser.urlencoded({ extended: true }), express.json(), express.urlencoded({ extended: true })]);
    app.use(cors());
    app.use('/products', productRoute);


app.listen(port,()=>{
    console.log("it's working");
});

module.exports =app;