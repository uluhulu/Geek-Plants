import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/all_plants_screen/all_plants_viewmodel.dart';
import 'package:geek_plants/screens/main_screen/main_screen.dart';

class BottomBanner extends StatelessWidget {
  final List<Plant> myPlants;
  final AllPlantsViewModel viewModel;

  BottomBanner({
    Key key,
    @required this.myPlants,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: 71,
        width: 375,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Добавлено: ${myPlants.length} растений',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
              Spacer(),
              FlatButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => MainScreen()),
                    (route) => false,
                  );
                },
                child: Row(children: [
                  Text(
                    'Далее',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9.5),
                    child: Image.asset(
                      "assets/vector/vector136.png",
                      height: 15,
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
      alignment: Alignment.bottomCenter,
    );
  }
}
