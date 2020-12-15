import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/values/mocks.dart';

class PlantsInteractor {
  final List<Plant> allPlants = plantList;
  final List<Plant> myPlants = [];

  List<Plant> getAllPlants() => allPlants;

  List<Plant> getMyPlants() => myPlants;

  List<Plant> searchPlants(String plantName) {
    final searchedPlants = <Plant>[];
    allPlants.forEach((element) {
      if (element.name.toLowerCase().contains(plantName)) {
        searchedPlants.add(element);
      }
    });
    return searchedPlants;
  }

  List<Plant> filterPlants(String category) => allPlants
      .where(
        (element) => element.category == category,
      )
      .toList();

  void addPlantsToAll(Plant plant) => allPlants.add(plant);

  void addPlantsToMy(Plant plant) => myPlants.add(plant);

  void removeFromMy(Plant plant) =>
      myPlants.removeWhere((element) => element.name.contains(plant.name));
}
