import 'package:flutter/cupertino.dart';
import 'package:geek_plants/data/model/plant.dart';

enum EventType {
  transfer,
  feeding,
  watering,
  wetting,
}

class Event {
  final EventType type;
  final DateTime time;

  Event({
    @required this.type,
    @required this.time,
  });
}

String eventTypeMapper(EventType eventType) {
  switch (eventType) {
    case EventType.transfer:
      return 'Пересадить';
    case EventType.feeding:
      return 'Удобрить';
    case EventType.wetting:
      return 'Увлажнить';
    case EventType.watering:
      return 'Полить';
  }

  throw Exception("Неизвестный евент $eventType");
}
