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
      age: "1 год",
      size: "20 см",
      volume: "1 л",
      lighting: "у окна",
      placement: "юг",
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
    id: 2,
    name: "Бальзамин",
    latName: "лат.Balzamin",
    photoPath: balzPath,
    category: categories[3],
    events: [
      Event(
        id: 0,
        type: EventType.transfer,
        time: testTime.add(Duration(days: 4)),
        plantId: 2,
        plantName: "Бальзамин",
        plantImage: balzPath,
      ),
      Event(
        id: 1,
        type: EventType.transfer,
        time: testTime.add(Duration(days: 5)),
        plantId: 2,
        plantName: "Бальзамин",
        plantImage: balzPath,
      ),
    ],
    description:
        "Бальзамин -  род цветковых растений семейства Бальзаминовые. Род включает около 500 видов, широко распространённых в Северном полушарии и тропиках",
  ),
  Plant(
    id: 3,
    name: "Бифренария",
    latName: "лат.Bifrenaria",
    photoPath: bifrenariaPath,
    category: categories[1],
    events: [
      Event(
        id: 0,
        type: EventType.watering,
        time: testTime.add(Duration(days: 3)),
        plantId: 3,
        plantName: "Бифренария",
        plantImage: bifrenariaPath,
      ),
    ],
    description:
        "24–26 видов составляют род Бифренария из семейства Орхидных. Эпифитные растения в природе обитают на территории Латинской Америки. При классификации рода, как это часто случается с орхидеями, не удалось избежать путаницы. Вначале цветы были приписаны к Дендробиуму, затем к Максиллярии. Еще позднее Бифренария лишилась миниатюрных представителей, выделенных в собственный род.",
  ),
  Plant(
    id: 4,
    name: "Гаура",
    latName: "лат.Gaura",
    photoPath: gauraPath,
    category: categories[4],
    events: [
      Event(
        id: 0,
        type: EventType.feeding,
        time: testTime.add(Duration(days: 10)),
        plantId: 4,
        plantName: "Гаура",
        plantImage: gauraPath,
      ),
    ],
    description:
        "Гаура – это последнее растение, украшающее осенний сад, последний аккорд уходящего лета. Кажется, к чему здесь яркие краски, когда на пороге холодной зимы сад застыл в ожидании времени года, приходящего на смену осени.",
  ),
  Plant(
    id: 5,
    name: "Пион",
    latName: "лат.Paeonia",
    photoPath: pionPath,
    category: categories[2],
    events: [
      Event(
        id: 0,
        type: EventType.feeding,
        time: testTime.add(Duration(days: 3)),
        plantId: 5,
        plantName: "Пион",
        plantImage: pionPath,
      ),
      Event(
        id: 1,
        type: EventType.wetting,
        time: testTime.add(Duration(days: 7)),
        plantId: 5,
        plantName: "Пион",
        plantImage: pionPath,
      ),
    ],
    description:
        "Пион- «царь цветов». Луковичное растение, относится к семейству Пионовые. Пионы очень яркие, эффектные и пышные цветы. К тому же пионы обладают яркой сочной зеленью и сильным насыщенным ароматом.",
  ),
  Plant(
    id: 6,
    name: "Роза",
    latName: "лат.Rose",
    photoPath: rosePath,
    category: categories[3],
    events: [
      Event(
        id: 0,
        type: EventType.wetting,
        time: testTime.add(Duration(days: 2)),
        plantId: 6,
        plantName: "Роза",
        plantImage: rosePath,
      ),
    ],
    description:
        "Ро́за — собирательное название видов и сортов представителей рода Шиповник (лат. Rósa), выращиваемых человеком. Большая часть сортов роз получена в результате длительной селекции путём многократных повторных скрещиваний и отбора. Некоторые сорта являются формами дикорастущих видов.",
  ),
];
