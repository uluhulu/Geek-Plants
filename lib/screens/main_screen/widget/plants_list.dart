import 'package:flutter/cupertino.dart';
import 'package:geek_plants/screens/widgets/plant_card.dart';
import 'package:geek_plants/values/mocks.dart';

class PlantsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return PlantCardMainScreen(
            plant: plantList[index],
          );
        },
        childCount: 3,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 0,
      ),
    );
  }
}
