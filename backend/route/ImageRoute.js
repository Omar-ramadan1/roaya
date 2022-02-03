const express = require('express');
const router = express.Router();
const { getImage, insertImage, deleteImage } = require('../logic/imageLogic');

router.get('/', getImage);
router.post('/', insertImage);
router.delete('/:id', deleteImage);


module.exports = router;