import 'package:geek_plants/data/model/event_old.dart';

class Plant {
  final int id;
  final String name;
  final String latName;
  final String photoPath;
  final String description;
  final String category;
  final String age;
  final String size;
  final String volume;
  final String lighting;
  final String placement;

  final List<Event> events;

  var isSelected = false;

  Plant({
    this.id,
    this.name,
    this.latName,
    this.photoPath,
    this.description,
    this.category,
    this.age,
    this.size,
    this.volume,
    this.lighting,
    this.placement,
    this.events,
    this.isSelected = false,
  });
}
