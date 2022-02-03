import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roaya/constant/constant.dart';
import 'package:roaya/logic/CommonFunctions.dart';
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
  final CommonFunctions commonFunctions = CommonFunctions();
  String? _imagePath , _imageURL;
  // Post user data to server
  void postDateProfile() async {
    // upload image data first to the server and then the server
    // return a  url of the image which is saved on cloudinary
    http.StreamedResponse imageUploadResponse =
        await commonFunctions.uploadAssetImages(_imagePath!);

    // here we then react to the response coming from the server with is the image url
    // to be able to call the image when we need

    imageUploadResponse.stream.transform(utf8.decoder).listen((imageURL) async {
      // the time have come to send the user data with the image url as image url part of user data
      // after that we can call the image by image url as much as we want as long as we have the Map which have the user data
      http.Response postProductResponse = await http.post(Uri.parse('${serverURL}products'), body: {
        "name": "khaled",
        "price": "30",
        "desc": "desc",
        "quantity": "20",
        "imageURL": imageURL
      });
      Map postProductResponseBody =  jsonDecode(postProductResponse.body);
      setState(() {
        _imageURL = postProductResponseBody["imageURL"];
      });
    });
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imagePath = image?.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_widget("AddProducts"),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "namOfProduct"),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: PriceController,
                decoration: const InputDecoration(labelText: "priceOfProduct"),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: decsriptionController,
                decoration: const InputDecoration(labelText: "description"),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "quantity"),
                textInputAction: TextInputAction.next,
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, right: 20, left: 40),
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    //getImage();
                    postDateProfile();
                  },
                  color: Colors.amber,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Upload",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 130,
                child: _imagePath == null
                    ? const Text("data")
                    : Image.file(File(_imagePath!)),
              ),
              SizedBox(
                width: 200,
                height: 130,
                child: _imageURL == null
                    ? const Text("_imageURL")
                    : Image.network(_imageURL!),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, right: 20, left: 40),
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    getImage();
                  },
                  color: Colors.amber,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "PickImage",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
