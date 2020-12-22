import 'package:geek_plants/data/interactor/plants_interactor.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';

class CalendarInteractor {
  final PlantsInteractor plantsInteractor;

  CalendarInteractor(this.plantsInteractor);

  Map<DateTime, List<Event>> getAllEvents() {
    final allEvents = <DateTime, List<Event>>{};

    plantsInteractor.getMyPlants().forEach((plant) {
      plant.events.forEach((event) {
        var time = event.time;
        if (!allEvents.containsKey(time)) {
          var key = time;
          List<Event> values = [];
          plantsInteractor.getMyPlants().forEach((e) {
            e.events.forEach((event) {
              if (event.time == key) {
                values.add(event);
              }
            });
          });
          allEvents[key] = values;
        }
      });
    });

    return allEvents;
  }

  List<Event> getEventsByDay(DateTime dateTime) {
    final List<Event> dayEvents = [];
    plantsInteractor.getMyPlants().forEach((plant) {
      plant.events.forEach((event) {
        if (event.time.year == dateTime.year &&
            event.time.month == dateTime.month &&
            event.time.day == dateTime.day) {
          dayEvents.add(event);
        }
      });
    });

    print("dayEvents: $dayEvents");
    return dayEvents;
  }
}
