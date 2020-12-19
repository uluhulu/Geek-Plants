import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/screens/all_plants_screen/all_plants_screen.dart';
import 'package:geek_plants/screens/auth_screen/auth_screen.dart';
import 'package:geek_plants/screens/calendar_day_screen/calendar_day_screen.dart';
import 'package:geek_plants/screens/calendar_screen/calendar_screen.dart';
import 'package:geek_plants/screens/main_screen/main_screen.dart';
import 'package:geek_plants/screens/plant_change_info_screen/plant_change_info_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      // home: MainScreen(),
      // home: AuthScreen(),
      home: PlantChangeInfo(),
    );
  }
}
