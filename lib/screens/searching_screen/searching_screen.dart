import 'package:flutter/material.dart';
import 'package:geek_plants/mocks.dart';
import 'package:geek_plants/screens/widgets/bottom_banner.dart';
import 'package:geek_plants/screens/widgets/plant_card.dart';
import 'package:geek_plants/screens/widgets/searching_app_bar.dart';

class SearchingScreen extends StatefulWidget {
  @override
  _SearchingScreenState createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  var firstWord = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 71,
            width: 375,
            color: Colors.white,
          ),
          CustomScrollView(
            slivers: [
              SearchingAppBar(),
              SliverList(
                delegate: SliverChildListDelegate(
                  generateGroupedList(),
                ),
              ),
            ],
          ),
          BottomBanner(),
        ],
      ),
    );
  }

  List<Widget> generateGroupedList() {
    var groupedList = <Widget>[];
    var tmpGroupWord = "";
    for (var i = 0; i < plantList.length; i++) {
      var plant = plantList[i];
      if (plant.name[0] != tmpGroupWord) {
        tmpGroupWord = plant.name[0];
        groupedList.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tmpGroupWord.toUpperCase() + tmpGroupWord.toLowerCase(),
                style: TextStyle(
                  color: Color.fromRGBO(74, 171, 66, 1),
                  fontSize: 20.0,
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color.fromRGBO(74, 171, 66, 1),
              ),
            ],
          ),
        ));
      }
      groupedList.add(
        Row(
          children: [
            Flexible(child: PlantCard(plant: plant)),
            if (i < plantList.length - 1)
              Flexible(
                child: PlantCard(
                  plant: plantList[i],
                ),
              ),
            if (i == plantList.length - 1)
              Flexible(
                child: Container(),
              ),
          ],
        ),
      );
    }

    return groupedList;
  }
}
