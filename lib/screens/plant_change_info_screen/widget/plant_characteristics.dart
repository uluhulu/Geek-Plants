import 'package:flutter/material.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/expandable_edit_card.dart';

class PlantCharacteristics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPlantsCharacteristics();
  }

  Widget _buildPlantsCharacteristics() {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0, bottom: 63.0, top: 63),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 21.0),
            child: Text(
              "Характеристики",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Возраст",
            onSelect: (String selectedValue) {},
            values: ["1 год", "2 года", "3 года"],
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Размер/Высота",
            onSelect: (String selectedValue) {},
            values: [ "20 см", "40 см","60 см", "80 см", "100 см","150 см", "200 см" ],
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Объем горшка",
            onSelect: (String selectedValue) {},
            values: [ "1 л", "2 л","3 л","4 л", "5 л","6 л", "8 л","10 л", "15 л" ],
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Освещение",
            onSelect: (String selectedValue) {},
            values: [ "У окна", "В комнате" ],
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Освещение",
            onSelect: (String selectedValue) {},
            values: [ "Север", "Запад", "Юг" , "Восток"  ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlantAge() {
    return ExpandableCharCard(
      title: "Возраст",
      onSelect: (String selectedValue) {},
      values: ["1 год", "2 года", "3 года"],
    );
    return Padding(
      padding: const EdgeInsets.only(
        top: 23.0,
        bottom: 23.0,
        right: 15.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Возраст',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Spacer(),
            Opacity(
              opacity: 0.5,
              child: Text(
                '2 года',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              width: 9.5,
            ),
            Image.asset(
              "assets/vector/vector136.png",
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantSize() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 23.0,
        bottom: 23.0,
        right: 15.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Размер/Высота',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Spacer(),
            Text(
              'Маленький(30см)',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.5)),
            ),
            Container(
              width: 9.5,
            ),
            Image.asset(
              "assets/vector/vector136.png",
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantPotVolume() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 23.0,
        bottom: 23.0,
        right: 15.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Объем горшка',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Spacer(),
            Text(
              '2 л',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.5)),
            ),
            Container(
              width: 9.5,
            ),
            Image.asset(
              "assets/vector/vector136.png",
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantLighting() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 23.0,
        bottom: 23.0,
        right: 15.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Освещение',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Spacer(),
            Text(
              'У окна',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.5)),
            ),
            Container(
              width: 9.5,
            ),
            Image.asset(
              "assets/vector/vector136.png",
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantLocation() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 23.0,
        bottom: 23.0,
        right: 15.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Местоположение',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Spacer(),
            Text(
              'Север',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.5)),
            ),
            Container(
              width: 9.5,
            ),
            Image.asset(
              "assets/vector/vector136.png",
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.black12,
    );
  }
}
