const express =require('express');
const router = express.Router();
const {getProducts, insertProduct,deleteProducts} = require('../logic/productLogic');

router.get('/', getProducts);
router.post('/',insertProduct);
router.delete('/:id',deleteProducts);


module.exports = router;