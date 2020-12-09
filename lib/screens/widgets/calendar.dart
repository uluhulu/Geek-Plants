import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/screens/widgets/event_builder.dart';
import 'package:table_calendar/table_calendar.dart';

enum CalendarType {
  collapse,
  expand,
}

enum CalendarEvent {
  transfer,
  feeding,
  watering,
  wetting,
}

class Calendar extends StatefulWidget {
  final Map<DateTime, List<CalendarEvent>> events;

  final CalendarType calendarType;
  final OnDaySelected onDaySelected;

  Calendar({
    this.events,
    this.calendarType = CalendarType.collapse,
    this.onDaySelected,
  });

  @override
  State<StatefulWidget> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _initCalendarController();
  }

  void _initCalendarController() {
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
      events: widget.events,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: getSwipeDirection(),
      initialCalendarFormat: CalendarFormat.week,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.white),
        weekendStyle: TextStyle(color: Colors.grey),
      ),
      calendarStyle: CalendarStyle(
        selectedColor: Colors.grey,
        todayColor: Colors.white,
        todayStyle: TextStyle(color: Colors.black),
        markersColor: Colors.blue,
        outsideDaysVisible: false,
        outsideStyle: TextStyle(color: Colors.white),
        weekdayStyle: TextStyle(color: Colors.white),
        weekendStyle: TextStyle(color: Colors.grey),
        unavailableStyle: TextStyle(color: Colors.white),
        eventDayStyle: TextStyle(color: Colors.white),
        contentDecoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white24,
              width: 1,
            ),
          ),
        ),
      ),
      builders: CalendarBuilders(
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          if (events.isNotEmpty) {
            children.add(
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: buildCalendarEvents(calendarEvent: events),
              ),
            );
          }

          return children;
        },
      ),
      rowHeight: 74,
      headerVisible: false,
      onDaySelected: widget.onDaySelected,
    );
  }

  AvailableGestures getSwipeDirection() {
    switch (widget.calendarType) {
      case CalendarType.collapse:
        return AvailableGestures.horizontalSwipe;
      case CalendarType.expand:
        return AvailableGestures.verticalSwipe;
    }

    throw Exception('unknown calendar type');
  }


}
