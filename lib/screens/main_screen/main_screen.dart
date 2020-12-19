import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/di.dart';
import 'package:geek_plants/screens/all_plants_screen/all_plants_screen.dart';
import 'package:geek_plants/screens/main_screen/main_screen_viewmodel.dart';
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
  final viewModel = MainScreenViewModel(
    plantsInteractor: plantsInteractor,
    calendarInteractor: calendarInteractor,
  );

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Appbar(),
          FlexibleCalendar(
            viewModel: viewModel,
          ),
          PlantListHeader(),
          PlantsList(
            viewModel: viewModel,
          ),
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
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => AllPlantsScreen()),
        );
      },
    );
  }
}
