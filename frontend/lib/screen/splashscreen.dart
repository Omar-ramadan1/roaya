import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roaya/screen/homepage.dart';

import 'package:roaya/screen/loginscreen.dart';
import 'package:roaya/widgets/splash_widget.dart';

import '../models/userdata.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print(context.read<UserData>().getUserData);
        context.read<UserData>().userData == null ? print("null") : print("objectdddddd");

    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => context.read<UserData>().userData == null
              ? const LoginPage()
              : const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreenWidget());
  }
}
