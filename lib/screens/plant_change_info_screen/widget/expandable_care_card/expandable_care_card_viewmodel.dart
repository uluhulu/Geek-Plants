import 'dart:async';

import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';

class ExpandableCareCardViewModel {
  final Plant plant;
  final eventsMap = <DateTime, List<Event>>{};
  final plantEvents = StreamController<Map<DateTime, List<Event>>>();

  var id = 0;

  ExpandableCareCardViewModel(this.plant);

  void handlePlantEvents(DateTime day, EventType type) {
    if (plant.events.isNotEmpty) {
      Event plantEvent;
      plant.events.forEach((element) {
        if(element.time == day){
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
      id: id,
      type: type,
      time: time,
      plantId: plant.id,
      plantName: plant.name,
      plantImage: plant.photoPath,
    );
    plant.events.add(event);
    eventsMap[time] = [event];
    id++;
  }

  void removeEvent(Event event, DateTime time) {
    plant.events.remove(event);
    eventsMap.remove(time);
    id--;
  }

  void dispose() {
    plantEvents.close();
  }
}
