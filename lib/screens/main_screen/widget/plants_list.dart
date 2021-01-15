import 'package:flutter/cupertino.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/main_screen/main_screen_viewmodel.dart';
import 'package:geek_plants/screens/widgets/plant_card.dart';
import 'package:geek_plants/values/mocks.dart';

class PlantsList extends StatelessWidget {
  final List<Plant> plants;

  const PlantsList({
    Key key,
    @required this.plants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return PlantCardMainScreen(
            plant: plants[index] ?? [],
          );
        },
        childCount: plants?.length ?? 0,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 0,
      ),
    );
  }
}
