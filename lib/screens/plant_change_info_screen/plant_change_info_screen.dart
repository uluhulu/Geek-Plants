import 'package:flutter/material.dart';
import 'package:geek_plants/model/plant.dart';

class PlantChangeInfo extends StatefulWidget {
  Plant plant;

  PlantChangeInfo({@required this.plant});

  @override
  _PlantChangeInfoState createState() => _PlantChangeInfoState();
}

class _PlantChangeInfoState extends State<PlantChangeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
