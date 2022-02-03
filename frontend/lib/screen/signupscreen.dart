import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Create an account",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
            ],
          ),


          Container(
            margin: EdgeInsets.only(top: 80),
            height: MediaQuery.of(context).size.height/1.5,
            decoration:const BoxDecoration(
              color: Colors.white,
               borderRadius: BorderRadius.only(
                 topRight: Radius.circular(90),
                 topLeft: Radius.circular(90),
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90),

            ),
            
            
            ) ,
            child: Container(
              margin: const EdgeInsets.only(top: 120,left: 45,right: 50),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      decoration:
                      InputDecoration(
                        hintText: "Enter your email",
                        hintStyle:const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor: const Color(0xFFe7edeb),
                      prefixIcon: Icon(Icons.email,color:Colors.grey[600]),

                      ),

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                         TextField(
                           decoration:
                           InputDecoration(
                             hintText: "Enter your passworld",
                             hintStyle:const TextStyle(color: Colors.grey),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8),
                             borderSide: BorderSide.none
                           ),
                           filled: true,
                           fillColor: const Color(0xFFe7edeb),
                           prefixIcon: Icon(Icons.lock,color:Colors.grey[600]),

                           ),

                         ),
                    const SizedBox(
                      height: 20,
                    ),
                     TextField(
                       decoration:
                       InputDecoration(
                         hintText: "Confirm your passworld",
                         hintStyle:const TextStyle(color: Colors.grey),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8),
                         borderSide: BorderSide.none
                       ),
                       filled: true,
                       fillColor: const Color(0xFFe7edeb),
                       prefixIcon: Icon(Icons.lock,color:Colors.grey[600]),

                       ),

                     ),
                  

                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: double.infinity,
                      child: RaisedButton(onPressed: (){
                                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                      },
                      color: Colors.amber,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text("SignUp",style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),),
                        
                      ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      
      
    );
  }
}