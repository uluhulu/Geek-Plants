import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geek_plants/data/interactor/calendar_interactor.dart';
import 'package:geek_plants/data/interactor/plants_interactor.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';

class MainScreenViewModel {
  final PlantsInteractor plantsInteractor;
  final CalendarInteractor calendarInteractor;

  final StreamController<List<Plant>> myPlants = StreamController();
  final StreamController<Map<DateTime, List<EventType>>> events =
      StreamController();

  MainScreenViewModel({
    @required this.plantsInteractor,
    @required this.calendarInteractor,
  });

  void dispose() {
    myPlants.close();
    events.close();
  }

  void init() {
    initEvents();
    initPlants();
  }

  void initEvents() {
    final allEvent = calendarInteractor.getAllEvents();
    events.add(allEvent);
  }

  void initPlants() {
    myPlants.add(plantsInteractor.getMyPlants());
  }
}
