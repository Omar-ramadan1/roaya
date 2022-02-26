import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roaya/constant/constant.dart';
import 'package:roaya/screen/signupscreen.dart';
import 'package:http/http.dart' as http;
import '../models/userdata.dart';
import 'homepage.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? errorText;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  postDateProfile() async {
    var response = await http.post(Uri.parse('${serverURL}auth/login'), body: {
      "email": _emailcontroller.text,
      "password": _passwordcontroller.text,
    });
    Map jsonBody = jsonDecode(response.body);
    if (jsonBody["isFound"]) {
      Map userDataa = jsonBody["user"];
                context.read<UserData>().setUserDataFunc(userDataa);

      context.read<UserData>().userData = userDataa;

      print(context.read<UserData>().userData);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      setState(() {
        errorText = jsonBody["message"];
      });
    }

    print(response.body);
    //  if(response.body == "")
    return response;
  }

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
            context.read<UserData>().userData == null ? print("null") : print("objectdddddd");

  }

  //  @override
  //  void dispose(){
  //     super.dispose();
  //      FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  //  }
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
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(90),
                  topLeft: Radius.circular(90),
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 120, left: 45, right: 50),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
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
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color(0xFFe7edeb),
                            prefixIcon:
                                Icon(Icons.email, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget your passworld",
                            style: TextStyle(
                                color: Colors.amber,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      errorText == null
                          ? Container()
                          : Text(
                              errorText!,
                              style: TextStyle(color: Colors.red),
                            ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  postDateProfile();
                                }
                              },
                              color: Colors.amber,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don\'t have an account ",
                                style: TextStyle(fontSize: 15),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )
                        ],
                      )
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
}
