import 'package:flutter/material.dart';
import 'package:geek_plants/model/plant.dart';

class PlantCard extends StatelessWidget {
  Plant plant;
  PlantCard({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildPlantImage(plant.photoPath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                mini: true,
                heroTag: Container(),
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
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
    );
  }
  Widget _buildPlantImage(String path){
    return Image.asset(
      plant.photoPath,
      fit: BoxFit.fitWidth,
      width: 164,
    );

    Widget _buildPlantNameContainer(){

    }
  }
}
