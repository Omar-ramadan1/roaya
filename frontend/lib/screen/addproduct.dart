import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roaya/constant/constant.dart';
import 'package:roaya/widgets/Appbar_widget.dart';
import 'package:http/http.dart' as http;

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController PriceController = TextEditingController();

  final TextEditingController decsriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  postDateProfile() async {
    var response = await http.post(Uri.parse('${serverURL}products'), body: {
      "name": nameController.text,
      "price": PriceController.text,
      "desc": decsriptionController.text,
      "quantity": quantityController.text,
    });
    print(response.body);
    return response;
  }

  XFile? _image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_widget("AddProducts"),
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "namOfProduct"),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: PriceController,
              decoration: InputDecoration(labelText: "priceOfProduct"),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: decsriptionController,
              decoration: InputDecoration(labelText: "description"),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: quantityController,
              decoration: InputDecoration(labelText: "quantity"),
              textInputAction: TextInputAction.next,
            ),
            Container(
              margin: EdgeInsets.only(top: 50, right: 20, left: 40),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  //getImage();
                  postDateProfile();
                },
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Upload",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            // Container(
            //   child: _image == null ? Text("data") : Image.file(_image),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 50, right: 20, left: 40),
            //   width: double.infinity,
            //   child: RaisedButton(
            //     onPressed: () {
            //       getImage();
            //     },
            //     color: Colors.amber,
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 16.0),
            //       child: Text(
            //         "PickImage",
            //         style: TextStyle(color: Colors.black, fontSize: 16),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
