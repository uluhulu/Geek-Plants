import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/widgets/plant_card.dart';

class GroupedList extends StatelessWidget {
  final List<Plant> plantsList;
  final List<Plant> myPlantsList;
  final List<String> cached = [];
  final VoidCallback addCallback;

  GroupedList({
    Key key,
    @required this.plantsList,
    @required this.myPlantsList,
    @required this.addCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        generateGroupedList(),
      ),
    );
  }

  List<Widget> generateGroupedList() {
    var groupedList = <Widget>[];
    var tmpGroupWord = "";
    for (var i = 0; i < plantsList.length; i++) {
      var plant = plantsList[i];
      if (plant.name[0] != tmpGroupWord) {
        tmpGroupWord = plant.name[0];

        groupedList.add(_buildHeader(tmpGroupWord));
      }
      groupedList.add(_buildContent(tmpGroupWord));
    }

    groupedList.add(Container(
      height: 70,
    ));

    return groupedList;
  }

  Widget _buildHeader(String header) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header.toUpperCase() + header.toLowerCase(),
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
    );
  }

  Widget _buildContent(String currentHeader) {
    var list = <Plant>[];
    for (int i = 0; i < getPlantsByHeader(currentHeader).length; i++) {
      if (!cached.contains(getPlantsByHeader(currentHeader)[i].name)) {
        list.add(getPlantsByHeader(currentHeader)[i]);
        cached.add(getPlantsByHeader(currentHeader)[i].name);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          for (int i = 0; i < list.length; i++)
            PlantCard(
              plant: list[i],
              myPlantsList: myPlantsList,
              addCallback: addCallback,
            )
        ],
      ),
    );
  }

  List<Plant> getPlantsByHeader(String header) {
    return plantsList.where((element) {
      return element.name[0] == header;
    }).toList();
  }
}
