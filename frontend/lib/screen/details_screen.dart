import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roaya/constant/constant.dart';

import '../models/userdata.dart';
import 'package:http/http.dart' as http;

import '../widgets/buttonwidget.dart';

class CharacterDetailsScreen extends StatefulWidget {
  static const roteName = '/FirstPagee';

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  updateDateProfile() async {
    print(Uri.parse(
        '${serverURL}auth/signup/${context.read<UserData>().userData?['_id']}'));
    var response = await http.put(
        Uri.parse(
            '${serverURL}auth/signup/${context.read<UserData>().userData?['_id']}'),
        body: {
          "budget":
              "${context.read<UserData>().userData?['budget'] - ProductInfo["price"]}"
        });
    print(response.body);
    Map jsonBody = jsonDecode(response.body);
    Map userData = jsonBody;
    context.read<UserData>().setUserDataFunc(userData["studentData"]);
    print(response.body);
    return response;
  }

  Map ProductInfo = {};
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    String offerInfoString =
        jsonEncode(ModalRoute.of(context)!.settings.arguments);
    setState(() {
      ProductInfo = jsonDecode(offerInfoString);
    });
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.amber,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(ProductInfo["name"]),
        background: Container(
          child: Image.network(
            ProductInfo["imageURL"],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.black,
      thickness: 2,
    );
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              buildSliverAppBar(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          characterInfo('coursename : ', ProductInfo["name"]),
                          buildDivider(250),
                          characterInfo('price : ',
                              "${ProductInfo["price"].toString()} \$"),
                          buildDivider(300),
                          characterInfo('description : ', ProductInfo["desc"]),
                          buildDivider(250),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 500,
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Button_Widget(
                "Buy Now", MediaQuery.of(context).size.width, 75, Colors.amber,
                () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${context.read<UserData>().userData?['name']}, ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Do You want to buy ${ProductInfo["name"]} course",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "your budget is:${context.read<UserData>().userData?['budget']}\$",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "course's cost is:${ProductInfo["price"].toString()}\$",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "your budget will be: ${context.read<UserData>().userData?['budget'] - ProductInfo["price"]}\$",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        FlatButton(onPressed: () {}, child: Text("cancel")),
                        FlatButton(
                            onPressed: () {
                              updateDateProfile();
                              //print("${context.read<UserData>().userData?['budget'] - ProductInfo["price"]}");

                              Navigator.pop(context);
                            },
                            child: Text("yes")),
                      ],
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
