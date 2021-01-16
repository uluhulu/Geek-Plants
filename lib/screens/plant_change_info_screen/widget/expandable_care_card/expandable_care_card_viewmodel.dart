import 'dart:async';

import 'package:geek_plants/data/model/event_old.dart';

class ExpandableCareCardViewModel {
  final List<Event> events;
  final String plantName;
  final String photoPath;
  final int plantId;
  final EventType type;
  final eventsMap = <DateTime, List<Event>>{};
  final plantEvents = StreamController<Map<DateTime, List<Event>>>();

  ExpandableCareCardViewModel(
    this.events,
    this.type,
    this.plantName,
    this.photoPath,
    this.plantId,
  ) {
    initEvents();
  }

  void initEvents() {
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
    plantEvents.add(eventsMap);
  }

  void handlePlantEvents(DateTime day, EventType type) {
    if (events.isNotEmpty) {
      Event plantEvent;
      events.forEach((element) {
        if (element.time == day && element.type == type) {
          plantEvent = element;
        }
      });

      if (plantEvent == null) {
        addEvent(type, day);
      } else {
        removeEvent(plantEvent, day);
      }
    } else {
      addEvent(type, day);
    }

    plantEvents.add(eventsMap);
  }

  void addEvent(EventType type, DateTime time) {
    final event = Event(
      id: events.length,
      type: type,
      time: time,
      plantId: plantId,
      plantName: plantName,
      plantImage: photoPath,
    );
    events.add(event);
    eventsMap[time] = [event];
  }

  void removeEvent(Event event, DateTime time) {
    events.remove(event);
    eventsMap.remove(time);
  }

  void dispose() {
    plantEvents.close();
  }
}
