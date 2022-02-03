import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:roaya/screen/details_screen.dart';
import 'package:roaya/widgets/Appbar_widget.dart';
import 'package:roaya/widgets/BottomBarWidget.dart';
import 'package:roaya/widgets/Drawer_Widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imagess = [
    "assets/images/lab1.png",
    "assets/images/lab2.png",
    "assets/images/lab3.png",
    "assets/images/lab4.png",
  ];
  var offers = [
    "assets/images/lab1.png",
    "assets/images/lab2.png",
    "assets/images/lab3.png",
    "assets/images/lab4.png",
  ];

  final List<String> list = [
    "assets/images/lab1.png",
    "assets/images/lab2.png",
    "assets/images/lab3.png",
    "assets/images/lab4.png",
  ];
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_widget("Home"),
      drawer: Drawer_Widget(),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      "Offers",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index)),
                  itemCount: imagess.length,
                  itemBuilder: (context, index, realindex) {
                    final images = imagess[index];
                    return buildImage(images, index);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 3.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.brown),
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.brown),

                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.brown),

                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Our Products",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 6,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: (){
                        Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => CharacterDetailsScreen(),
                    ),
                  );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    padding: EdgeInsetsDirectional.all(4),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(8),
                      
                    ),
                    child: GridTile(child: Container(
                      color: Colors.amber,
                    ),),
                  ),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          //    FlutterPhoneDirectCaller.callNumber(number)
          // Utils.openPhoneCall("01091366579");
        },
        child: Icon(Icons.phone),
      ),
    );
  }
//  _launchURL() async {
//     SimplePermissions.requestPermission(Permission.CallPhone)
//         .then((state) async {
//       if (state == PermissionStatus.authorized) {
//         String a = Uri.encodeFull("#");
//         String url = 'tel:*123' + a;
//         if (await canLaunch(url)) {
//           await launch(url);
//         } else {
//           throw 'Could not launch $url';
//         }
//       }
//     });}
  // _callNumber() async {
  //   //launch("tel://$number");
  //   const number = '08592119XXXX'; //set the number here
  //   bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  // }

  Widget buildImage(String image, int index) => Container(
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.brown),

          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: AssetImage(image),
          // )
        ),
      );
}
