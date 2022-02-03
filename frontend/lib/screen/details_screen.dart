import 'dart:math';

import 'package:flutter/material.dart';


class CharacterDetailsScreen extends StatelessWidget {

 

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.amber,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
         "",
          style: TextStyle(color: Colors.red),
        ),
       
      ),
    );
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
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
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



  // Widget displayRandomQuoteOrEmptySpace(state) {
  //   var quotes = (state).quotes;
  //   if (quotes.length != 0) {
  //     int randomQuoteIndex = Random().nextInt(quotes.length - 1);
  //     return Center(
  //       child: DefaTultTextStyle(
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontSize: 20,
  //             color: Colors.blue,
  //           shadows: [
  //             Shadow(
  //               blurRadius: 7,
  //             color: Colors.blue,
  //               offset: Offset(0, 0),
  //             )
  //           ],
  //         ),

  //       ),
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

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
      body: CustomScrollView(
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
                   
                      buildDivider(250),
                 
                      buildDivider(280),
                      buildDivider(300),
                   
                      buildDivider(235),
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
    );
  }
}
