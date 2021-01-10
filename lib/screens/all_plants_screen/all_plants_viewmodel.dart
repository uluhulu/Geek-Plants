import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geek_plants/data/interactor/plants_interactor.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/di.dart';
import 'package:geek_plants/values/mocks.dart';

class AllPlantsViewModel {
  final PlantsInteractor interactor;

  final StreamController<List<Plant>> plantsController =
      StreamController.broadcast();

  var currentCategory = categories[0];

  AllPlantsViewModel({
    @required this.interactor,
  });

  void init() {
    loadPlantList();
  }

  void dispose() {
    plantsController.close();
  }

  void loadPlantList() async {
    await Future.delayed(Duration(seconds: 1));
    plantsController.add(interactor.allPlants);
  }

  void searchPlants(String name) async {
    plantsController.add(null);
    await Future.delayed(Duration(milliseconds: 500));
    final searchedPlants = interactor.searchPlants(name);
    if (searchedPlants.isNotEmpty) {
      plantsController.add(searchedPlants);
      return;
    }
    plantsController.addError("Ничего не найдено");
  }

  void filterPlants(String category) {
    currentCategory = category;
    if (currentCategory == categories[0]) {
      plantsController.add(interactor.allPlants);
      return;
    }
    final filteredPlants = interactor.filterPlants(category);
    if (filteredPlants.isNotEmpty) {
      plantsController.add(filteredPlants);
      return;
    }
    plantsController.addError("Растений с такой категорией не найдено");
  }

  void addToMy(Plant plant) {
    plantsInteractor.addPlantsToMy(plant);

    if (currentCategory != categories[0]) return filterPlants(plant.category);
    plantsController.add(interactor.allPlants);
  }

  void removeFromMy(Plant plant) {
    plantsInteractor.removeFromMy(plant);

    if (currentCategory != categories[0]) return filterPlants(plant.category);
    plantsController.add(interactor.allPlants);
  }

}
