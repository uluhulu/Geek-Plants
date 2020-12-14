import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/screens/widgets/event_builder.dart';
import 'package:table_calendar/table_calendar.dart';

enum CalendarType {
  collapse,
  expand,
}

class Calendar extends StatelessWidget {
  final Map<DateTime, List<Event>> events;

  final CalendarType calendarType;
  final OnDaySelected onDaySelected;
  final Function(DateTime date) updateDate;
  final CalendarController calendarController;

  Calendar({
    this.events,
    this.calendarType = CalendarType.collapse,
    this.onDaySelected,
    @required this.calendarController,
    this.updateDate,
  });

  @override
  Widget build(BuildContext context) {
    print("тип календаря ${calendarType}");
    return TableCalendar(
      calendarController: calendarController,
      events: events,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: getSwipeDirection(),
      initialCalendarFormat: calendarType == CalendarType.collapse
          ? CalendarFormat.week
          : CalendarFormat.month,
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
              buildCalendarEvents(calendarEvent: events),
            );
          }

          return children;
        },
      ),
      onCalendarCreated: (first, last, format) {
        updateDate(first);
      },
      onVisibleDaysChanged: (first, last, format) {
        updateDate(first);
      },
      rowHeight: calendarType == CalendarType.collapse
          ? 74
          : MediaQuery.of(context).size.height / 8,
      headerVisible: false,
      onDaySelected: onDaySelected,
    );
  }

  AvailableGestures getSwipeDirection() {
    switch (calendarType) {
      case CalendarType.collapse:
        return AvailableGestures.horizontalSwipe;
      case CalendarType.expand:
        return AvailableGestures.verticalSwipe;
    }

    throw Exception('unknown calendar type');
  }
}
