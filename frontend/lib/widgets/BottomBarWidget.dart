import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class BottomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(35) , topRight: Radius.circular(35)),
        border: Border.all(width: 2.0, color: Colors.transparent,
        ),

        color:Colors.amber,
      ),
      height: 60,

      child: Container(

        margin: EdgeInsets.only(left: 30 , right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                    GestureDetector(
              onTap: (){
              
                },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Icon(Icons.local_offer,color: Colors.white,),
                    Text("Orders" , style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),
                    )

                  ],
                ),
              ),
            ),  
          GestureDetector(

              onTap: (){
              
                },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Icon(Icons.category,color: Colors.white,size: 25,),
                    Text("Category" , style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),
                    )

                  ],
                ),
              ),
            ),
              GestureDetector(

              onTap: (){

            
                },
              child: Container(
                margin: EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    Icon(Icons.home,color: Colors.white,size: 25,),
                    Text("Home" , style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
