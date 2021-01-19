import 'package:flutter/cupertino.dart';
import 'package:geek_plants/data/model/plant.dart';

enum EventType {
  transfer,
  feeding,
  watering,
  wetting,
}

class Event {
  final int id;
  final EventType type;
  final DateTime time;

  final int plantId;
  final String plantName;
  final String plantImage;

  var isDone = false;

  Event({
    @required this.id,
    @required this.type,
    @required this.time,
    @required this.plantId,
    @required this.plantName,
    @required this.plantImage,
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
