import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geek_plants/data/interactor/plants_interactor.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/values/mocks.dart';

class AllPlantsViewModel {
  final PlantsInteractor interactor;

  final StreamController<List<Plant>> plantsController = StreamController();
  final StreamController<List<Plant>> myPlantsController =
      StreamController.broadcast();

  AllPlantsViewModel({
    @required this.interactor,
  });

  void init() {
    loadPlantList();
    getMyPlants();
  }

  void dispose() {
    plantsController.close();
    myPlantsController.close();
  }

  void loadPlantList() async {
    await Future.delayed(Duration(seconds: 1));
    plantsController.add(interactor.getAllPlants());
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

    if (category == categories[0]) {
      plantsController.add(interactor.getAllPlants());
      getMyPlants();
      return;
    }
    final filteredPlants = interactor.filterPlants(category);
    if (filteredPlants.isNotEmpty) {
      plantsController.add(filteredPlants);
      getMyPlants();
      return;
    }
    plantsController.addError("Растений с такой категорией не найдено");
  }

  void getMyPlants() {
    myPlantsController.add(interactor.getMyPlants());
  }
}
