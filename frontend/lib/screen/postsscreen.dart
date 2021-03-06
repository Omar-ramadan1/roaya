import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roaya/widgets/Appbar_widget.dart';

class PostsScreen extends StatefulWidget {
  static const roteName = '/postsscreen';

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  List productsList = [];

  getProduct() async {
    var url = Uri.parse(
        'https://newsdata.io/api/1/news?apikey=pub_4767033a9a265f77d88157a03f130092a57f&q=cryptocurrency');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      setState(() {
        productsList = jsonObj['results'];
      });
      print(productsList);
    }
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_widget("Posts"),
       body: ListView(children: [
    for (int i = 0; i < productsList.length; i++)

        
         Row(
           children: [
             Text("date is: ${productsList[i]["pubDate"]}"),
           ],
         ),
             for (int i = 0; i < productsList.length; i++)

          Row(
           children: [
             Text("language is ${productsList[i]["language"]}"),
           ],
         ),

         
       ],),
    );
  }
}
