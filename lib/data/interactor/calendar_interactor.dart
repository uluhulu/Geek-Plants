import 'package:geek_plants/data/model/event.dart';
import 'package:geek_plants/data/model/plant.dart';

class CalendarInteractor {
  final List<Plant> plants;

  CalendarInteractor(this.plants);

  List<Event> getAllEvents() {
    final allEvents = <Event>[];

    plants.forEach((element) {
      element.events.forEach((element) {
        allEvents.add(element);
      });
    });

    return allEvents;
  }

  List<Map<Plant, Event>> getEventsByDay(DateTime date) {
    final List<Map<Plant, Event>> dayEvents = [];

    plants.forEach((plant) {
      plant.events.forEach((event) {
        if (event.date.year == date.year &&
            event.date.month == date.month &&
            event.date.day == date.day) {
          dayEvents.add({plant: event});
        }
      });
    });

    return dayEvents;
  }
}
