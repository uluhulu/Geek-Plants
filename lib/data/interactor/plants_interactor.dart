import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/values/mocks.dart';

class PlantsInteractor {
  final List<Plant> allPlants = plantList;
  final List<Plant> myPlants = [];

  List<Plant> getAllPlants() => allPlants;

  List<Plant> getMyPlants() => myPlants;

  List<Plant> searchPlants(List<Plant> plantList, String plantName) =>
      plantList.where(
        (element) => element.name.contains(plantName),
      );

  List<Plant> filterPlants(String category) => allPlants.where(
        (element) => element.category == category,
      );

  void addPlantsToAll(Plant plant) => allPlants.add(plant);

  void addPlantsToMy(Plant plant) => myPlants.add(plant);
}
