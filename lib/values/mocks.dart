import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/values/pathStrings.dart';

List categories = [
  "Все",
  "Комнатные",
  "Уличные",
  "Цветущие",
  "Однолетние",
  "Многолетние"
];

final testTime = DateTime.now();
List<Plant> plantList = [
  Plant(
      name: "Абутилон (Катаника)",
      latName: "лат.Abutilon",
      photoPath: abutilonPath,
      category: categories[1],
      events: {
        testTime: [
          EventType.feeding,
          EventType.watering,
        ],
        testTime.add(Duration(days: 1)): [
          EventType.transfer,
          EventType.transfer,
        ],
      },
      description:
          "Абутилон — это неприхотливое и обильноцветущее комнатное растение. Это растение относится к семейству мальвовые. Его ближайшие «родственники» — гибискус и всем известная садовая шток-роза (мальва)."),
  Plant(
      name: "Агава",
      latName: "лат.Agave",
      photoPath: abutilonPath,
      events: {
        testTime: [
          EventType.wetting,
        ],
      },
      description:
          "Абутилон — это неприхотливое и обильноцветущее комнатное растение. Это растение относится к семейству мальвовые. Его ближайшие «родственники» — гибискус и всем известная садовая шток-роза (мальва)."),
  Plant(
    name: "Анал",
    latName: "лат.Impatience",
    photoPath: abutilonPath,
    category: categories[3],
    description:
        "Абутилон — это неприхотливое и обильноцветущее комнатное растение. Это растение относится к семейству мальвовые. Его ближайшие «родственники» — гибискус и всем известная садовая шток-роза (мальва).",
  ),
  Plant(
    name: "Бальзамин",
    latName: "лат.Impatience",
    photoPath: abutilonPath,
    category: categories[3],
    description:
        "Абутилон — это неприхотливое и обильноцветущее комнатное растение. Это растение относится к семейству мальвовые. Его ближайшие «родственники» — гибискус и всем известная садовая шток-роза (мальва).",
  ),
];
