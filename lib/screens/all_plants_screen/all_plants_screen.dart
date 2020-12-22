import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/di.dart';
import 'package:geek_plants/screens/all_plants_screen/all_plants_viewmodel.dart';
import 'package:geek_plants/screens/all_plants_screen/widget/grouped_list.dart';
import 'package:geek_plants/screens/widgets/plants_list_loader.dart';
import 'package:geek_plants/screens/widgets/bottom_banner.dart';
import 'package:geek_plants/screens/all_plants_screen/widget/searching_app_bar.dart';

class AllPlantsScreen extends StatefulWidget {
  @override
  _AllPlantsScreenState createState() => _AllPlantsScreenState();
}

class _AllPlantsScreenState extends State<AllPlantsScreen> {
  final viewModel = AllPlantsViewModel(interactor: plantsInteractor);

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: StreamBuilder<List<Plant>>(
          stream: viewModel.plantsController.stream,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Plant>> plantsSnapshot,
          ) {
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SearchingAppBar(
                      searchItems: viewModel.searchPlants,
                      choseCategory: viewModel.filterPlants,
                    ),
                    plantsSnapshot.hasError
                        ? SliverFillRemaining(
                            child: Center(
                              child: Text(
                                plantsSnapshot.error,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                          )
                        : plantsSnapshot.data != null
                            ? GroupedList(
                                plantsList: plantsSnapshot.data,
                                myPlantsList: plantsSnapshot.data ?? [],
                                viewModel: viewModel,
                              )
                            : PlantsListLoader(),
                  ],
                ),
                StreamBuilder<List<Plant>>(
                  stream: viewModel.plantsController.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Plant>> snapshot) {
                    final myList = snapshot?.data
                        ?.where((element) => element.isSelected)
                        ?.toList();
                    if (myList != null && myList.isNotEmpty) {
                      return BottomBanner(
                        myPlants: myList,
                        viewModel: viewModel,
                      );
                    }
                    return Container();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
