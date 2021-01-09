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
      id: 0,
      name: "Абутилон (Катаника)",
      latName: "лат.Abutilon",
      photoPath: abutilonPath,
      category: categories[1],
      events: [
        Event(
          id: 0,
          type: EventType.feeding,
          time: testTime,
          plantId: 0,
          plantName: "Абутилон",
          plantImage: abutilonPath,
        ),
        Event(
          id: 1,
          type: EventType.watering,
          time: testTime,
          plantId: 0,
          plantName: "Абутилон",
          plantImage: abutilonPath,
        ),
      ],
      description:
          "Абутилон — это неприхотливое и обильноцветущее комнатное растение. Это растение относится к семейству мальвовые. Его ближайшие «родственники» — гибискус и всем известная садовая шток-роза (мальва)."),
  Plant(
      id: 1,
      name: "Агава",
      latName: "лат.Agave",
      photoPath: agavaPath,
      events: [
        Event(
          id: 0,
          type: EventType.transfer,
          time: testTime,
          plantId: 1,
          plantName: "Агава",
          plantImage: agavaPath,
        ),
        Event(
          id: 1,
          type: EventType.transfer,
          time: testTime.add(Duration(days: 1)),
          plantId: 1,
          plantName: "Агава",
          plantImage: agavaPath,
        ),
      ],
      description:
          "Абутилон — это неприхотливое и обильноцветущее комнатное растение. Это растение относится к семейству мальвовые. Его ближайшие «родственники» — гибискус и всем известная садовая шток-роза (мальва)."),
  Plant(
    id: 3,
    name: "Бальзамин",
    latName: "лат.Balzamin",
    photoPath: balzPath,
    category: categories[3],
    events: [
      Event(
        id: 0,
        type: EventType.transfer,
        time: testTime.add(Duration(days: 4)),
        plantId: 3,
        plantName: "Бальзамин",
        plantImage: balzPath,
      ),
      Event(
        id: 1,
        type: EventType.transfer,
        time: testTime.add(Duration(days: 5)),
        plantId: 3,
        plantName: "Бальзамин",
        plantImage: balzPath,
      ),
    ],
    description:
        "Бальзамин -  род цветковых растений семейства Бальзаминовые. Род включает около 500 видов, широко распространённых в Северном полушарии и тропиках",
  ),
  Plant(
    id: 2,
    name: "Роза",
    latName: "лат.Rose",
    photoPath: rosePath,
    category: categories[3],
    events: [
      Event(
        id: 0,
        type: EventType.wetting,
        time: testTime.add(Duration(days: 1)),
        plantId: 2,
        plantName: "Роза",
        plantImage: rosePath,
      ),
    ],
    description:
    "Ро́за — собирательное название видов и сортов представителей рода Шиповник (лат. Rósa), выращиваемых человеком. Большая часть сортов роз получена в результате длительной селекции путём многократных повторных скрещиваний и отбора. Некоторые сорта являются формами дикорастущих видов.",
  ),
];
