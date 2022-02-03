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
  String? _image , _imageURL;
  void postDateProfile() async {
    http.Response postProductResponse;
    http.StreamedResponse imageUploadResponse =
        await commonFunctions.uploadAssetImages(_image!);
    imageUploadResponse.stream.transform(utf8.decoder).listen((imageURL) async {
      postProductResponse =
          await http.post(Uri.parse('${serverURL}products'), body: {
        "name": "khaled",
        "price": "30",
        "desc": "desc",
        "quantity": "20",
        "imageURL": imageURL
      });
      Map postProductResponseBody =  jsonDecode(postProductResponse.body);
      print(postProductResponseBody["imageURL"]);
      setState(() {
        _imageURL = postProductResponseBody["imageURL"];
      });
      print(_imageURL);
    });
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image?.path;
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
                child: _image == null
                    ? const Text("data")
                    : Image.file(File(_image!)),
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
