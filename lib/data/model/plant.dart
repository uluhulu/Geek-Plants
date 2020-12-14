import 'package:geek_plants/data/model/event.dart';

class Plant {
  final String name;
  final String latName;
  final String photoPath;
  final String description;
  final String category;

  final List<Event> events;

  Plant({
    this.name,
    this.latName,
    this.photoPath,
    this.description,
    this.category,
    this.events,
  });
}
