import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/screens/widgets/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CardCalendar extends StatelessWidget {
  final String title;
  final String image;
  final List<Event> events;
  final EventType type;

  const CardCalendar({
    Key key,
    this.title,
    this.image,
    this.events,
    this.type,
  }) : super(key: key);

  Map<DateTime, List<Event>> getEventsMap() {
    Map<DateTime, List<Event>> eventsMap = {};
    if (events != null)
      events.forEach((event) {
        var time = event.time;
        if (!eventsMap.containsKey(time)) {
          var key = time;
          List<Event> values = [];
          events.forEach((e) {
            if (event.time == key && event.type == type) {
              values.add(event);
            }
          });
          eventsMap[key] = values;
        }
      });

    return eventsMap;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 234,
        height: 300,
        child: Card(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 8),
                    child: Row(children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        image,
                        width: 13,
                        height: 16.9,
                      ),
                    ]),
                  )),
              Calendar(
                updateDate: (dateTime) {},
                calendarType: CalendarType.expand,
                calendarController: CalendarController(),
                weekDayColor: Colors.black,
                todayColor: Colors.green.shade50,
                rowHeight: 16,
                events: getEventsMap(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
