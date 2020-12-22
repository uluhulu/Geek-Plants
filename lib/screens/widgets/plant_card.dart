import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/di.dart';
import 'package:geek_plants/screens/all_plants_screen/all_plants_viewmodel.dart';
import 'package:geek_plants/screens/plant_information_screen/plant_information_screen.dart';

class PlantCard extends StatefulWidget {
  final Plant plant;
  final AllPlantsViewModel viewModel;
  final List<Plant> myPlantsList;

  PlantCard({
    @required this.plant,
    @required this.viewModel,
    @required this.myPlantsList,
  });

  @override
  State<StatefulWidget> createState() {
    return PlantCardState();
  }
}

class PlantCardState extends State<PlantCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlantInformation(plant: widget.plant)),
          );
        },
        child: Stack(
          children: <Widget>[
            _buildPlantImage(widget.plant.photoPath),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                height: 56,
                width: 122,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                      child: Text(
                        widget.plant.name,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                      child: Text(
                        widget.plant.latName,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          // fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                mini: true,
                heroTag: Container(),
                onPressed: () {
                  setState(() {

                    if (widget.plant.isSelected) {
                      // plantsInteractor.removeFromMy(widget.plant);
                      widget.viewModel.removeFromMy(widget.plant);
                    } else {
                      widget.viewModel.addToMy(widget.plant);
                      // plantsInteractor.addPlantsToMy(widget.plant);
                    }
                  });
                },
                child: Icon(
                  widget.plant.isSelected ? Icons.done : Icons.add,
                  size: 28,
                  color: widget.plant.isSelected ? Colors.green : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantImage(String path) {
    return Image.asset(
      widget.plant.photoPath,
      fit: BoxFit.fitWidth,
      width: 164,
    );
  }
}

class PlantCardMainScreen extends StatelessWidget {
  final Plant plant;

  PlantCardMainScreen({
    @required this.plant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlantInformation(plant: plant)),
          );
        },
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Ink(child: _buildPlantImage(plant.photoPath)),
            Padding(
              padding: const EdgeInsets.only(top: 180.0, right: 42),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                alignment: Alignment.bottomCenter,
                height: 56,
                width: 122,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                        child: Text(
                          plant.name,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                        child: Text(
                          plant.latName,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                            // fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantImage(String path) {
    return Image.asset(
      plant.photoPath,
      fit: BoxFit.fitWidth,
      width: 164,
    );
  }
}
