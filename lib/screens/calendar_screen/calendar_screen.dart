import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/screens/widgets/calendar.dart';
import 'package:geek_plants/util/time_formatter.dart';
import 'package:geek_plants/values/colors.dart';
import 'package:geek_plants/values/mocks.dart';
import 'package:geek_plants/values/strings.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  final calendarController = CalendarController();

  var currentDate = 'test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: calendarBackgroundColor,
      appBar: _buildAppbar(),
      body: _buildCalendar(),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      backgroundColor: calendarBackgroundColor,
      centerTitle: true,
      shadowColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.info_outline),
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      ],
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
        ],
      ),
      bottom: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            currentDate,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.2),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        preferredSize: Size(0, 20),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      color: calendarBackgroundColor,
      child: Calendar(
        updateDate: (dateTime) async {
          await Future.delayed(Duration(milliseconds: 5));
          setState(() {
            currentDate = getStringFromDateTime(dateTime);
          });
        },
        onDaySelected: (day, events, holidays) {},
        calendarType: CalendarType.expand,
        calendarController: calendarController,
        events: {
          DateTime.now(): [
            Event(
              type: EventType.watering,
              plant: plantList[0],
            ),
            Event(
              type: EventType.feeding,
              plant: plantList[0],
            ),
            Event(
              type: EventType.transfer,
              plant: plantList[0],
            ),
          ]
        },
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          calendarController.setFocusedDay(DateTime.now());
        });
      },
      backgroundColor: Colors.white.withOpacity(0.5),
      child: Icon(
        Icons.keyboard_arrow_up_sharp,
        color: calendarBackgroundColor,
      ),
    );
  }
}
