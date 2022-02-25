import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roaya/models/userdata.dart';
import 'package:roaya/screen/details_screen.dart';
import 'package:roaya/screen/loginscreen.dart';
import 'package:roaya/screen/splashscreen.dart';


void main() {
   runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
      routes: 
      {
        CharacterDetailsScreen.roteName:(ctx)=> CharacterDetailsScreen()
      },
    );
  }
}

