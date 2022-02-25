import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roaya/screen/details_screen.dart';
import 'package:roaya/widgets/Appbar_widget.dart';
import 'package:roaya/widgets/BottomBarWidget.dart';
import 'package:roaya/widgets/Drawer_Widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';
import '../models/userdata.dart';
import '../widgets/home_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List productsList = [];
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


  getProduct() async {
    var url = Uri.parse('${serverURL}products');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      setState(() {
        productsList = jsonObj['result'];
      });
      print(productsList);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
       // context.read<UserData>().getUserData();

  }

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,

   //   appBar: Appbar_widget("Home"),
  //  appBar: AppBar(
  //    backgroundColor: Colors.amber,
  //       elevation: 0.0,
  //  ),
      drawer: Drawer_Widget(),
      body:Stack(
        children: [
          background(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  header(),
                  search(),
                 
                  SizedBox(height: 16),
                  titleList('Course ', () {}),
                
                    for (int i = 0; i < productsList.length; i++)
                        HomeDetails(productsList[i])
                  
                ],
              ),
            ),
          ),
        ],
      ),
      //  Container(
      //   color: Colors.white,
      //   child: ListView(
      //     children: [
      //       Center(
      //         child: Text(
      //           "Courses",
      //           style:
      //               TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 5,
      //       ),
      //       for (int i = 0; i < productsList.length; i++)
      //        HomeDetails(productsList[i])
      //     ],
      //   ),
      // ),
   //   bottomNavigationBar: BottomBarWidget(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.amber,
      //   onPressed: () {
      //     //    FlutterPhoneDirectCaller.callNumber(number)
      //     // Utils.openPhoneCall("01091366579");
      //   },
      //   child: Icon(Icons.phone),
      // ),
    );
  }
    Widget background() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
    Widget header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
           IconButton(
          icon: Icon(Icons.menu,
              color: Colors.white,
              size: 40),
          onPressed: (){
            _scaffoldState.currentState?.openDrawer();
          },),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
                Text(
                  context.read<UserData>().userData?['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(50),
          //   child: Image.asset(
          //     Assets.imageAvatar,
          //     width: 50,
          //     height: 50,
          //     fit: BoxFit.cover,
          //   ),
          // )
        ],
      ),
    );
  }
Widget search() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search on course',
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.indigo[900],
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(0),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.indigo[900],
          ),
          IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.indigo[900],
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
   Widget titleList(String title, Function function) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          GestureDetector(
            child: Icon(Icons.navigate_next),
            onTap: () => function,
          ),
        ],
      ),
    );
  }

  Widget listOnProgress() {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
       // Course course = Assets.courses[index];
        return Container(
          margin: EdgeInsets.fromLTRB(
            0,
            index == 0 ? 0 : 8,
            0,
            index == 1 ? 0 : 8,
          ),
          decoration: BoxDecoration(
            color: Colors.indigo[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              
              children: [
                   for (int i = 0; i < productsList.length; i++)
      //        HomeDetails(productsList[i])
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    productsList[i]['imageURL'],
                    fit: BoxFit.fill,
                    height: 60,
                    width: 60,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       // productsList[i]['imageURL'],
                       "",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                       "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      // child: Icon(
                      //   Icons.play_arrow_rounded,
                      //   size: 40,
                      //   color: Colors.indigo[900],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
