import 'dart:async';

import 'package:geek_plants/data/interactor/calendar_interactor.dart';
import 'package:geek_plants/data/interactor/plants_interactor.dart';
import 'package:geek_plants/data/model/event_old.dart';

class CalendarDayViewModel {
  final StreamController<List<Event>> tasks = StreamController();

  final PlantsInteractor _plantsInteractor;
  final CalendarInteractor _calendarInteractor;

  final DateTime day;

  CalendarDayViewModel(
    this._plantsInteractor,
    this._calendarInteractor,
    this.day,
  );

  void init() {
    tasks.add(_calendarInteractor.getEventsByDay(day));
  }

  void addToComplete(Event event) {
    _plantsInteractor.completeEvent(event);
    tasks.add(_calendarInteractor.getEventsByDay(day));
  }

  void removeFromComplete(Event event) {
    _plantsInteractor.uncompleteEvent(event);
    tasks.add(_calendarInteractor.getEventsByDay(day));
  }
}
