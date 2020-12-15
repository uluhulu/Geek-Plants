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
List<Plant> plantList = [
  Plant(
      name: "Абутилон (Катаника)",
      latName: "лат.Abutilon",
      photoPath: abutilonPath,
      category: categories[1],
      description:
          "Абутилон — это неприхотливое и обильноцветущее комнатное растение. Это растение относится к семейству мальвовые. Его ближайшие «родственники» — гибискус и всем известная садовая шток-роза (мальва)."),
  Plant(
      name: "Агава",
      latName: "лат.Agave",
      photoPath: abutilonPath,
      category: categories[2],
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
