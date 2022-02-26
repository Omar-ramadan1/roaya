import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roaya/screen/addproduct.dart';
import 'package:roaya/screen/getallproductscreen.dart';
import 'package:roaya/screen/loginscreen.dart';
import 'package:roaya/screen/postsscreen.dart';

import '../models/userdata.dart';
import 'Inkwell.dart';

class Drawer_Widget extends StatefulWidget {
  const Drawer_Widget({Key? key}) : super(key: key);

  @override
  _Drawer_WidgetState createState() => _Drawer_WidgetState();
}

// ignore: camel_case_types
class _Drawer_WidgetState extends State<Drawer_Widget> {
  @override
  Widget build(BuildContext context) {
    return
    
    Drawer(
      backgroundColor: Colors.amber,
      child: ListView(
        children: <Widget>[
         
       
          Container(

            height: MediaQuery.of(context).size.height ,
            color: Colors.amber,
            child: Column(
              children: [
                Container(
                      margin: EdgeInsets.only(top: 50,bottom: 120),                      
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width / 9,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,size: 40,
                              color: Color(0xFFBD954F),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${context.read<UserData>().userData?['email']}",
                                style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white) 
                                
                                ,),
                                
                              ],
                            ),
                          ),Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${context.read<UserData>().userData?['name']}",
                                style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white) 
                                
                                ,),
                                
                              ],
                            ),
                        ],
                      ),
                    ),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title: Text("Home",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.home,size: 30,color: Colors.white,),
                  )
                ),
                 InkWell(
                  onTap: (){
                      Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => GetProduct(),
                    ),
                  );
                  },
                  child:ListTile(
                    title: Text("My account",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.person,size: 30,color: Colors.white,),
                  )
                ),
                 InkWell(
                  onTap: (){
                      Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => AddProducts(),
                    ),
                  );
                  },
                  
                  child:ListTile(
                    title: Text("AddCourse",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.add_shopping_cart,size: 30,color: Colors.white,),
                  )
                ),
                     
               
                
               
              
                InkWell(
                  onTap: (){
                    Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => PostsScreen(),
                    ),
                  );
                  },
                  child:ListTile(
                    title: Text("Posts",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.settings,size: 30,color: Colors.white,),
                  )
                ),
                
                  InkWell(
                  onTap: (){},
                  child:ListTile(
                    title: Text("About",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.help,size: 30,color: Colors.white,),
                  )
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                  },
                  child:ListTile(
                    title: Text("Logout",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.logout,size: 30,color: Colors.white,),
                  )
                ),
          

                   

     
                               
         
                          
    
              ],
            ),
          )
        ],
      ),
    );
  
  }
}
