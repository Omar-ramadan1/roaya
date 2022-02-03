import 'package:flutter/material.dart';

class Appbar_widget extends StatelessWidget with PreferredSizeWidget {
  final String name;
  Appbar_widget(this.name);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white,size: 30),
      elevation: 0,
      toolbarHeight: 80,
      title: Text(name),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90),

            ),
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.amber],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
      ),
    );
  }

  @override
  // TODO: implement preferredSize

  Size get preferredSize => Size.fromHeight(90);
}
