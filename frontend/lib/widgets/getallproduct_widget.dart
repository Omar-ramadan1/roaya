import 'package:flutter/material.dart';


class GetAllProduct extends StatelessWidget {
  final Map productInfo;
   GetAllProduct(this.productInfo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        margin: EdgeInsets.only(left: 30),
        child: Text(productInfo["quantity"].toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
      leading: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Text(productInfo["name"],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
      trailing: Container(
        margin: EdgeInsets.only(right: 20),
        child: Text(productInfo["price"].toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),)
      
    );
  }
}