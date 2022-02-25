import 'package:flutter/material.dart';
import 'package:roaya/screen/details_screen.dart';

class HomeDetails extends StatelessWidget {
  final Map productInfo;
  HomeDetails(this.productInfo);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, CharacterDetailsScreen.roteName,
                arguments: productInfo);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.brown),
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.network(productInfo["imageURL"]).image,
                )),
          ),
        ),
        Positioned(
            bottom: 20,
            child: Opacity(
              opacity: .6,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "learn more",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "Buy it",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
