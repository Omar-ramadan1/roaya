
const fs = require('fs');
const Busboy = require('busboy');
var mongoose = require('mongoose');
var cloudinary = require('cloudinary').v2

cloudinary.config({
    cloud_name: 'dohsjyvur',
    api_key: '471713839541679',
    api_secret: 'ucT1nVOkAg6KV_V2cf8PCDIrseM'
});

module.exports = {
    getImage: async (req, res, next) => {

    },
    insertImage: async (req, res) => {
        var id = new mongoose.Types.ObjectId();
        console.log(id.toHexString());
        let name = "image" + id;
        console.log(name);
        var busboy = Busboy({ headers: req.headers });
        busboy.on('file', function (fieldname, file, filename, encoding, mimetype) {
            let upload = cloudinary.uploader.upload_stream({ public_id: name, folder: "roaya/test" }, (err, result) => {
                console.log(err, result);
                res.end(result["secure_url"]);
            })
            file.pipe(upload);
        });
        req.pipe(busboy);
    },
    deleteImage: async (req, res) => {

    }

}