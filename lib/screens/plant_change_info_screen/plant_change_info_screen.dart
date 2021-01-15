import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/cancel_button.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_add_photo.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_care.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_characteristics.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_cover/plant_cover.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_name.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/save_button.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/title.dart';
import 'package:geek_plants/values/pathStrings.dart';

class PlantChangeInfo extends StatefulWidget {
  Plant plant;
  PlantChangeInfo({@required this.plant});

  @override
  _PlantChangeInfoState createState() => _PlantChangeInfoState();
}

class _PlantChangeInfoState extends State<PlantChangeInfo> {
  Plant plant = new Plant(events: []);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "О растении",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              name: widget.plant.name,
              latName: widget.plant.latName,
            ),
            _buildSeparator(),
            PlantCover(photoPath: widget.plant.photoPath),
            _buildSeparator(),
            PlantName(),
            // PlantAddPhoto(),
            PlantCharacteristics(),
            PlantCareCharacteristics(plant: plant),
            Center(child: SaveButton()),
            Center(child: CancelButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.black12,
      ),
    );
  }
}
