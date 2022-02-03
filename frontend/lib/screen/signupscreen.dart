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
          Container(
           // margin: EdgeInsets.all( 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create an account",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.only(top: 80),
            height: MediaQuery.of(context).size.height/1.5,
            decoration:BoxDecoration(
              color: Colors.white,
               borderRadius: BorderRadius.only(
                 topRight: Radius.circular(90),
                 topLeft: Radius.circular(90),
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90),

            ),
            
            
            ) ,
            child: Container(
              margin: EdgeInsets.only(top: 120,left: 45,right: 50),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        decoration: 
                        InputDecoration(
                          hintText: "Enter your email",
                          hintStyle:TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        prefixIcon: Icon(Icons.email,color:Colors.grey[600]),
                        
                        ),
                        
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                         Container(
                      child: TextField(
                        decoration: 
                        InputDecoration(
                          hintText: "Enter your passworld",
                          hintStyle:TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        prefixIcon: Icon(Icons.lock,color:Colors.grey[600]),
                        
                        ),
                        
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                     Container(
                      child: TextField(
                        decoration: 
                        InputDecoration(
                          hintText: "Confirm your passworld",
                          hintStyle:TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        prefixIcon: Icon(Icons.lock,color:Colors.grey[600]),
                        
                        ),
                        
                      ),
                    ),
                  

                    Container(
                      margin: EdgeInsets.only(top: 50),
                      width: double.infinity,
                      child: RaisedButton(onPressed: (){
                                 Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                      },
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
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