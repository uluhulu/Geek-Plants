import 'package:flutter/cupertino.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/main_screen/main_screen_viewmodel.dart';
import 'package:geek_plants/screens/widgets/plant_card.dart';
import 'package:geek_plants/values/mocks.dart';

class PlantsList extends StatelessWidget {
  final MainScreenViewModel viewModel;

  const PlantsList({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Plant>>(
        stream: viewModel.myPlants.stream,
        builder: (context, snapshot) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PlantCardMainScreen(
                  plant: snapshot.data[index] ?? [],
                );
              },
              childCount: snapshot.data?.length ?? 0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 0,
            ),
          );
        });
  }
}
