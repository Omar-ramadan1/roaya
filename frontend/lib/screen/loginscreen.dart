import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roaya/screen/signupscreen.dart';

import 'homepage.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

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
                Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forget your passworld",
                        style: TextStyle(
                          color: Colors.amber,
                          decoration: TextDecoration.underline
                        ),),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          width: double.infinity,
                          child: RaisedButton(onPressed: (){
                               Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                          },
                          color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text("Login",style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),),
                            
                          ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don\'t have an account ",style: TextStyle(fontSize: 15),),
                            InkWell(
                                  onTap: (){
                 Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                  },
                              child: Text("SignUp",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.bold ),)),
                          ],
                        )
                      ],
                    )
                    
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