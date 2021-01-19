import 'dart:async';

import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';

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
              values.add(
                Event(
                  id: event.id,
                  type: event.type,
                  time: time,
                  plantId: event.plantId,
                  plantName: plantName,
                  plantImage: photoPath,
                ),
              );
            }
          });
          eventsMap[key] = values;
        }
      });
    plantEvents.add(eventsMap);
  }

  void updateEvents(String photoPath) {
    for (int i = 0; i < events.length; i++) {
      events[i] = Event(
        plantId: plantId,
        id: events[i].id,
        time: events[i].time,
        type: events[i].type,
        plantImage: photoPath,
        plantName: plantName,
      );
      print(photoPath);
    }
  }

  void handlePlantEvents(
    DateTime day,
    EventType type,
    String photoPath,
  ) {
    if (events.isNotEmpty) {
      Event plantEvent;
      events.forEach((element) {
        if (element.time == day && element.type == type) {
          plantEvent = element;
        }
      });

      if (plantEvent == null) {
        addEvent(type, day, photoPath);
      } else {
        removeEvent(plantEvent, day);
      }
    } else {
      addEvent(type, day, photoPath);
    }

    updateEvents(photoPath);
    plantEvents.add(eventsMap);
  }

  void addEvent(
    EventType type,
    DateTime time,
    String photoPath,
  ) {
    final event = Event(
      id: events.length,
      type: type,
      time: time,
      plantId: plantId,
      plantName: plantName,
      plantImage: photoPath,
    );
    print(photoPath);
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
