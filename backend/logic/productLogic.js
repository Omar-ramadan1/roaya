
const PRODUCTS = require('../module/productModule')
module.exports = {
    getProducts: async (req, res, next) => {
        const products = await PRODUCTS.find();
        res.json({
            result: products.map(res => {
                return {
                    id: res.id,
                    name: res.name,
                    price: res.price,
                    desc: res.desc,
                    imageURL: res.imageURL,
                    
                }
            })
        })
    },
    insertProduct: async (req, res) => {
        const product = await new PRODUCTS({
            name: req.body.name,
            price: req.body.price,
            desc: req.body.desc,
        //    quantity: req.body.quantity,
            imageURL: req.body.imageURL
        }).save()
        res.json({
            "message": "inserted successfully",
            id: product.id,
            name: product.name,
            price: product.price,
            desc: product.desc,
         //   quantity: product.quantity,
            imageURL: product.imageURL
        })

    },
    deleteProducts: async (req, res) => {
        const id = req.params.id;
        const del = await PRODUCTS.findByIdAndRemove(id);
        res.json({ "delete": del });
    }

}