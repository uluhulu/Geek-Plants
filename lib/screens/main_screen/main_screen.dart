import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event.dart';
import 'package:geek_plants/screens/main_screen/widget/appbar.dart';
import 'package:geek_plants/screens/main_screen/widget/bottom_menu.dart';
import 'package:geek_plants/screens/main_screen/widget/flexible_calendar.dart';
import 'package:geek_plants/screens/main_screen/widget/plant_list_header.dart';
import 'package:geek_plants/screens/main_screen/widget/plants_list.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Appbar(),
          FlexibleCalendar(),
          PlantListHeader(),
          PlantsList(),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.green,
        size: 48,
      ),
      onPressed: () {},
    );
  }
}
