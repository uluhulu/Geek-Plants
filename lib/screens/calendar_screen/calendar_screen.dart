import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/values/colors.dart';
import 'package:geek_plants/values/strings.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      backgroundColor: calendarBackgroundColor,
      centerTitle: true,
      toolbarHeight: 84,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      title: Column(
        children: [
          Text(
            calendarTitleScreen,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12,),
          Text(
            'Январь 2020',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.2),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
