const express = require('express');
const router = express.Router();
const {signup, login,updatesignup}=require('../logic/authLogic');

router.post('/signup',signup);
router.post('/login',login);
router.put('/signup/:id',updatesignup)



module.exports =router;