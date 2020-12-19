import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/values/pathStrings.dart';

Widget buildCalendarEvents({@required List<EventType> calendarEvent}) {
  List<Widget> eventsList = [];
  calendarEvent.forEach((element) {
    eventsList.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4),
      child: buildCalendarEvent(element),
    ));
  });

  return Align(
    alignment: Alignment.bottomCenter,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: eventsList,
      ),
    ),
  );
}

Widget buildCalendarEvent(EventType event) {
  String imagePath;
  switch (event) {
    case EventType.transfer:
      imagePath = transferIcon;
      break;
    case EventType.feeding:
      imagePath = feedingIcon;
      break;
    case EventType.watering:
      imagePath = wateringIcon;
      break;
    case EventType.wetting:
      imagePath = wettingIcon;
      break;
  }

  return Image.asset(
    imagePath,
    width: 8,
  );
}
