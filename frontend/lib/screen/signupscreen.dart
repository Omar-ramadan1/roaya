import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../models/userdata.dart';
import 'loginscreen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  List<String> items = ["teacher", "student"];
  String? value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      value = items[0];
    });
  }

  postDateProfile() async {
    var response = await http.post(Uri.parse('${serverURL}auth/signup'), body: {
      "name": _namecontroller.text,
      "email": _emailcontroller.text,
      "password": _passwordcontroller.text,
      "type": value,
      "budget":"100"
    });
    // Map jsonBody = jsonDecode(response.body);
    // Map userData = {
    //   "id": jsonBody["id"],
    //   "email": jsonBody["email"],
    //   "name":jsonBody["name"],
    //   "password": jsonBody["password"],
    //   "type":jsonBody["type"],
    //   "budget":jsonBody["budget"]

    // };
    // context.read<UserData>().setUserDataFunc(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Sign up",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(90),
                  topLeft: Radius.circular(90),
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 80, left: 45, right: 50),
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailcontroller,
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: const Color(0xFFe7edeb),
                          prefixIcon:
                              Icon(Icons.email, color: Colors.grey[600]),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _namecontroller,
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: const Color(0xFFe7edeb),
                          prefixIcon: Icon(Icons.person, color: Colors.grey[600]),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xFFe7edeb),
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: Colors.white, width: 4)),
                          child: DropdownButton<String>(
                            value: value,
                            isExpanded: true,
                            items: items.map(buildmenuItem).toList(),
                            onChanged: (value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _passwordcontroller,
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your passworld",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: const Color(0xFFe7edeb),
                          prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              postDateProfile();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            }
                          },
                          color: Colors.amber,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "SignUp",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildmenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
