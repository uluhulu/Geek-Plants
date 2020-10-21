import 'package:flutter/material.dart';
import 'package:geek_plants/model/plant.dart';
import 'package:geek_plants/screens/widgets/plant_card.dart';
import 'package:geek_plants/screens/widgets/searching_app_bar.dart';

import '../../mocks.dart';
import '../../pathStrings.dart';

class SearchingScreen extends StatefulWidget {
  @override
  _SearchingScreenState createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchingAppBar(),
          SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 164 / 224,
            children: List.generate(
              plantList.length,
              (index) {
                return PlantCard(
                  plant: plantList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
