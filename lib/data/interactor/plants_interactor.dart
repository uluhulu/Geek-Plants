import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/values/mocks.dart';

class PlantsInteractor {
  final List<Plant> allPlants = plantList;

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

  void addPlantsToMy(Plant plant) {
    allPlants[allPlants.indexWhere((element) => element.id == plant.id)]
        .isSelected = true;
  }

  void removeFromMy(Plant plant) {
    allPlants[allPlants.indexWhere((element) => element.id == plant.id)]
        .isSelected = false;
  }

  List<Plant> getMyPlants() {
    return allPlants.where((element) => element.isSelected).toList();
  }

  void completeEvent(Event event) {
    final plant = allPlants[
        allPlants.indexWhere((element) => event.plantId == element.id)];

    plant.events[plant.events.indexWhere((element) => event.id == element.id)]
        .isDone = true;
  }

  void uncompleteEvent(Event event) {
    final plant = allPlants[
        allPlants.indexWhere((element) => event.plantId == element.id)];

    plant.events[plant.events.indexWhere((element) => event.id == element.id)]
        .isDone = false;
  }
}
