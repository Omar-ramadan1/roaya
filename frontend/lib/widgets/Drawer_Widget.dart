import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roaya/screen/addproduct.dart';

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
      child: Column(
        children: <Widget>[
         
       
          Container(

            height: MediaQuery.of(context).size.height ,
            color: Colors.amber,
            child: Column(
              children: [
                Container(
                      margin: EdgeInsets.only(top: 50,bottom: 120),
                      decoration: BoxDecoration(
                        color: Color(0xFFBD954F),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width / 9,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,size: 40,
                          color: Color(0xFFBD954F),
                        ),
                      ),
                    ),
                   // SizedBox(height: 40,),

                // Container(
                //   margin: EdgeInsets.only(top: 50),
                //  // height: 150,
                //     child: CircleAvatar(
                      
                //       backgroundColor: Colors.white,
                //       child: Icon(Icons.person),
                //     ),

                // ),


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
                      builder: (context) => AddProducts(),
                    ),
                  );
                  },
                  child:ListTile(
                    title: Text("ShopingCart",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.add_shopping_cart,size: 30,color: Colors.white,),
                  )
                ),
                     
               
                 InkWell(
                  onTap: (){},
                  child:ListTile(
                    title: Text("My account",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.person,size: 30,color: Colors.white,),
                  )
                ),
                  InkWell(
                  onTap: (){},
                  child:ListTile(
                    title: Text("Favourites",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.favorite,size: 30,color: Colors.white,),
                  )
                ),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title: Text("Contact",style: TextStyle(fontSize: 25,color: Colors.white),),
                    leading: Icon(Icons.call,size: 30,color: Colors.white,),
                  )
                ),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title: Text("Setting",style: TextStyle(fontSize: 25,color: Colors.white),),
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
          

                   

     
                               
         
                          
    
              ],
            ),
          )
        ],
      ),
    );
  
  }
}
