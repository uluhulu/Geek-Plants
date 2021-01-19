import 'dart:async';

import 'package:geek_plants/data/interactor/calendar_interactor.dart';
import 'package:geek_plants/data/model/event_old.dart';

class CalendarScreenViewModel {
  final CalendarInteractor calendarInteractor;
  final StreamController<Map<DateTime, List<Event>>> events =
      StreamController();
  final StreamController<String> currentDate = StreamController();

  CalendarScreenViewModel(this.calendarInteractor);

  void init() {
    initEvents();
    initDate(null);
  }

  void dispose() {
    events.close();
    currentDate.close();
  }

  void initEvents() {
    final allEvent = calendarInteractor.getAllEvents();
    events.add(allEvent);
  }

  void initDate(String time){
    currentDate.add(time);
  }
}
