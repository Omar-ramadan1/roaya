import 'package:flutter/material.dart';

class InkWELL extends StatelessWidget {
  final String name;
  final double sizeOfIcon, fontSize;
  final IconData icon;
  final GestureTapCallback navigator;

InkWELL(this.name, this.fontSize, this.sizeOfIcon, this.icon, this.navigator);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
          child: Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(icon)),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          onTap: navigator,
        );
  }
}