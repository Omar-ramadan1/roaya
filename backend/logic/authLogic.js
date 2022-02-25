const Auth = require('../module/authmodel');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
var mongoose = require('mongoose');

module.exports={
    signup: async( req ,res)=>{
        const user =Auth.find({email: req.body.email})
        if(user.length>=1){
            return res.json({message:"this email already  exist"});
        }else{
            bcrypt.hash(req.body.password,10,async( error,hash  )=>{
                if(error){
                    return res.json({message:"error in password" });
                }else{
                    const auth = await new Auth({
                        name: req.body.name,
                        email: req.body.email,
                        password: hash,
                        type: req.body.type,
                        budget: req.body.budget 
                    }).save();
                    res.json({
                        message:"create user successfully",
                        id: auth.id,
                        name:auth.name,
                        email: auth.email,
                        password: auth.hash,
                        type: auth.type,
                        budget:auth.budget
                    })
                }
            })
        }
    },
    // updatesignup: async (req, res) => {
    //     console.log(req.body);
    //     const contacts = await Auth
    //     contacts.findOneAndUpdate({ _id: mongoose.Types.ObjectId(req.body.id) }, req.body).then((result, error) => {
    //         // res.end("the change was suc");
    //         contacts.findOne({ _id: mongoose.Types.ObjectId(req.body.id) }, (error, result) => {
    //             console.log(result);
    //             res.json({
    //                 id: result.id,
    //                 name: result.name,
    //                 email: result.email,
    //                 budget:result.budget
    //             });
    //         });

    //     });
    //     // Character.findOneAndUpdate();
    // },
    updatesignup: async (req, res) => {
        // console.log(req.body);
        const contacts = await Auth
        console.log(req.params.id);
        contacts.findOneAndUpdate({_id:req.params.id},{name:req.body.name,email:req.body.email,budget:req.body.budget,type:req.body.type} 
        ,{new : true})
        .then(result=>{
                   console.log(result); 
            res.json({
                message:"updated user successfully",
                studentData :result,

                    // id: result.id,
                    // name: result.name,
                    // email: result.email,
                    // type: result.type,  
                    // budget: result.budget
    
                })
        })
        .catch(err=>{res.json(err.message)})
        // Character.findOneAndUpdate();
    },
    login: async(req, res)=>{
         const user = await Auth.find({email: req.body.email});
         if(user.length<1){
             return res.json({message:"this email not exist" , isFound : false});

         }else{
             bcrypt.compare(req.body.password,user[0].password,async(erorr, result)=>{
                 if(erorr){
                        return res.json({message:"password not found", isFound : false});
                 }
                 if(result){
                            if(user[0].type =="student"){
                                const token = jwt.sign({email:user[0].email,name: user[0].name,},"USER");
                                return res.json({
                                    message:"student logged in",
                                    user: user[0],
                                    token: token,
                                    isFound:true,
                                    isAdmin:false
                                })
                            }else{
                                const token = jwt.sign({email:user[0].email,name: user[0].name,},"ADMIN");
                                return res.json({
                                    message:"teacher logged in",
                                    user: user[0],
                                    token: token,
                                    isFound:true,
                                    isAdmin:true
                                })

                            }
                 }
             })
         }
    }
}