import 'package:flutter_test/flutter_test.dart';
import 'package:geek_plants/data/interactor/calendar_interactor.dart';
import 'package:geek_plants/data/interactor/plants_interactor.dart';
import 'package:geek_plants/data/model/event.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/values/pathStrings.dart';

void main() {
  List<Plant> plantList = [
    Plant(
      name: "Абутилон (Катаника)",
      latName: "лат.Abutilon",
      photoPath: abutilonPath,
      description: "dasdas",
      events: [
        Event(type: EventType.feeding, date: DateTime(2020, 12, 14)),
        Event(type: EventType.feeding, date: DateTime(2020, 12, 15)),
        Event(type: EventType.feeding, date: DateTime(2020, 12, 16)),
      ],
    ),
    Plant(
      name: "White widow",
      latName: "лат.White widow",
      photoPath: abutilonPath,
      description: "ганджубасик",
      events: [
        Event(type: EventType.feeding, date: DateTime(2020, 12, 13)),
        Event(type: EventType.feeding, date: DateTime(2020, 12, 15)),
        Event(type: EventType.feeding, date: DateTime(2020, 12, 16)),
      ],
    ),
  ];

  final plantsInteractor = PlantsInteractor();
  final calendarInteractor = CalendarInteractor(plantsInteractor);

  test(
    "Тест поиска всех евентов",
    () {
      expect(calendarInteractor.getAllEvents().length, 6);
    },
  );

  test(
    'Тест поиска евента по определенному дню',
    () {
      expect(
          calendarInteractor.getEventsByDay(DateTime(2020, 12, 14)).length, 1);
    },
  );
}
