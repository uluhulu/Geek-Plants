import 'package:flutter/material.dart';
import 'package:geek_plants/model/plant.dart';

import '../../pathStrings.dart';

class SearchingScreen extends StatefulWidget {
  @override
  _SearchingScreenState createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  List<Plant> plantList = [
    Plant(
      name: "Абутилон (Катаника)",
      latName: "лат.Abutilon",
      photoPath: abutilonPath,
    ),
    Plant(
      name: "Агава",
      latName: "лат.Agave",
      photoPath: abutilonPath,
    ),
    Plant(
      name: "Бальзамин",
      latName: "лат.Impatience",
      photoPath: abutilonPath,
    ),
    Plant(
      name: "Бальзамин",
      latName: "лат.Impatience",
      photoPath: abutilonPath,
    ),
    Plant(
      name: "Бальзамин",
      latName: "лат.Impatience",
      photoPath: abutilonPath,
    ),
    Plant(
      name: "Бальзамин",
      latName: "лат.Impatience",
      photoPath: abutilonPath,
    ),
    Plant(
      name: "очко",
      latName: "лат.Impatience",
      photoPath: abutilonPath,
    ),
  ];

  var firstWord = "";

  List categories = [
    "Все",
    "Комнатные",
    "Уличные",
    "Цветущие",
    "Однолетние",
    "Многолетние"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 196.0,
            floating: false,
            pinned: true,
            backgroundColor: Color.fromRGBO(30, 30, 30, 1),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Text("Добавьте свои растения!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontFamily: 'SFPro')),
                  ),
                  // SizedBox(height: 90.0),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 28, left: 14, right: 14),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(32.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                        hintText: 'Поиск',
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Colors.white),
                        prefixIcon: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xffC4C6CC),
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Color(0xffC4C6CC),
                        fontSize: 14.0,
                        fontFamily: 'Brutal',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var category in categories)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              generateGroupedList(),
            ),
          ),
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
        groupedList.add(Text(tmpGroupWord));
      }
      groupedList.add(
        Row(
          children: [
            Flexible(child: buildPlantCard(plant)),
            if (i < plantList.length - 1)
              Flexible(
                child: buildPlantCard(
                  plantList[i],
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

  Widget buildPlantCard(Plant plant) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            plant.photoPath,
            fit: BoxFit.fitWidth,
            width: 164,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                mini: true,
                heroTag: Container(),
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180.0, right: 42),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.bottomCenter,
              height: 56,
              width: 122,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                      child: Text(
                        plant.name,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                      child: Text(
                        plant.latName,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          // fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
