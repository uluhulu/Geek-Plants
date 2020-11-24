import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/screens/main_screen/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      // home: AuthScreen(),
      home: MainScreen(),
    );
  }
}
