import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/di.dart';
import 'package:geek_plants/values/mocks.dart';

class PlantChangeInfoViewModel {
  final Plant plant;

  var plantId = 0;
  var name = 'Имя растения';
  var latName = 'имя на латинском';
  var age = 'Не выбрано';
  var size = 'Не выбрано';
  var volume = 'Не выбрано';
  var lighting = 'Не выбрано';
  var placement = 'Не выбрано';
  var photoPath = 'не выбрано';
  var description = 'Небольшое описание растения';

  List<Event> events = [];

  PlantChangeInfoViewModel(this.plant);

  void init() {
    if (plant != null) {
      plantId = plant.id;
      name = plant.name;
      latName = plant.latName;
      age = plant.age;
      size = plant.size;
      volume = plant.volume;
      lighting = plant.lighting;
      placement = plant.placement;
      photoPath = plant.photoPath;
      events = plant.events;
      description = plant.description;
    } else {
      plantId = plantsInteractor.allPlants.length;
    }
  }

  void saveChanges() {
    if (plant != null) {
      updatePlant();
    } else {
      createNewPlant();
    }
  }

  void updatePlant() {
    var newPlant = Plant(
      id: plant.id,
      name: name,
      latName: latName,
      photoPath: photoPath,
      age: age,
      size: size,
      volume: volume,
      lighting: lighting,
      placement: placement,
      category: plant.category,
      isSelected: plant.isSelected,
      description: description,
      events: events,
    );

    plantsInteractor.updateMyPlant(newPlant);
  }

  void createNewPlant() {
    var newPlant = Plant(
      id: plantId,
      name: name,
      latName: latName,
      photoPath: photoPath,
      age: age,
      size: size,
      volume: volume,
      lighting: lighting,
      placement: "юг",
      category: categories[1],
      isSelected: true,
      description: description,
      events: events,
    );

    plantsInteractor.addPlantsToAll(newPlant);
  }
}
