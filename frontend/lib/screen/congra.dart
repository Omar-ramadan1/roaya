import 'package:flutter/material.dart';
import 'package:roaya/screen/homepage.dart';
import 'package:roaya/widgets/Appbar_widget.dart';

class Congra extends StatelessWidget {
  const Congra({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_widget("the course"),
      body: ListView(
        
        children: [
          Text("congratulation you have the course now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
       SizedBox(height: 20,),
       FlatButton(onPressed: (){
         Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
       }, child: Text("back to home"))
        ],
      ),
      
    );
  }
}