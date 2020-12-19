import 'package:geek_plants/data/interactor/plants_interactor.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';

class CalendarInteractor {
  final PlantsInteractor calendarInteractor;

  CalendarInteractor(this.calendarInteractor);

  Map<DateTime, List<EventType>> getAllEvents() {
    final allEvents = <DateTime, List<EventType>>{};

    DateTime tmpDate = DateTime(1900);
    calendarInteractor.myPlants.forEach((element) {
      element.events.forEach((key, value) {
        if(!key.isAtSameMomentAs(tmpDate)){
          tmpDate = key;
        }
      });
    });

    return allEvents;
  }

}
