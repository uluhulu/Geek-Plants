import 'package:geek_plants/data/interactor/calendar_interactor.dart';
import 'package:geek_plants/data/interactor/plants_interactor.dart';

final plantsInteractor = PlantsInteractor();
final calendarInteractor = CalendarInteractor(plantsInteractor);
