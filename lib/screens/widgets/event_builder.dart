import 'package:flutter/material.dart';
import 'package:geek_plants/screens/widgets/calendar.dart';
import 'package:geek_plants/values/pathStrings.dart';

Widget buildCalendarEvents({@required List<CalendarEvent> calendarEvent}) {
  List<Widget> eventsList = [];
  calendarEvent.forEach((element) {
    String imagePath;
    switch (element) {
      case CalendarEvent.transfer:
        imagePath = transferIcon;
        break;
      case CalendarEvent.feeding:
        imagePath = feedingIcon;
        break;
      case CalendarEvent.watering:
        imagePath = wateringIcon;
        break;
      case CalendarEvent.wetting:
        imagePath = wettingIcon;
        break;
    }
    eventsList.add(Image.asset(
      imagePath,
      width: 8,
    ));
  });

  return Container(
    width: 10,
    height: 10,
    child: Row(
      children: eventsList,
    ),
  );
}
