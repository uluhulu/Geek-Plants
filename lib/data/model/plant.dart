import 'package:geek_plants/data/model/event_old.dart';

class Plant {
  final int id;
  final String name;
  final String latName;
  final String photoPath;
  final String description;
  final String category;

  final List<Event> events;

  var isSelected = false;

  Plant({
    this.id,
    this.name,
    this.latName,
    this.photoPath,
    this.description,
    this.category,
    this.events,
  });
}
