import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/di.dart';
import 'package:geek_plants/screens/calendar_day_screen/calendar_day_screen.dart';
import 'package:geek_plants/screens/calendar_screen/calendar_screen_viewmodel.dart';
import 'package:geek_plants/screens/widgets/calendar.dart';
import 'package:geek_plants/util/time_formatter.dart';
import 'package:geek_plants/values/colors.dart';
import 'package:geek_plants/values/mocks.dart';
import 'package:geek_plants/values/strings.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  final calendarController = CalendarController();

  final viewModel = CalendarScreenViewModel(calendarInteractor);

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
          child: StreamBuilder<String>(
              stream: viewModel.currentDate.stream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.2),
                    fontWeight: FontWeight.w600,
                  ),
                );
              }),
        ),
        preferredSize: Size(0, 20),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      color: calendarBackgroundColor,
      child: StreamBuilder<Map<DateTime, List<Event>>>(
          stream: viewModel.events.stream,
          initialData: viewModel.calendarInteractor.getAllEvents(),
          builder: (context, snapshot) {
            return Calendar(
              updateDate: (dateTime) async {
                await Future.delayed(Duration(milliseconds: 5));
                viewModel.initDate(getStringFromDateTime(dateTime));
              },
              onDaySelected: (day, events, holidays) {
                if (events.isNotEmpty) {
                  _goToDayScreen(day);
                }
              },
              calendarType: CalendarType.expand,
              calendarController: calendarController,
              events: snapshot.data,
            );
          }),
    );
  }

  _goToDayScreen(DateTime day) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => CalendarDayScreen(
          day: day,
        ),
      ),
    );
    viewModel.initEvents();
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
        Icons.keyboard_arrow_up,
        color: calendarBackgroundColor,
      ),
    );
  }
}
