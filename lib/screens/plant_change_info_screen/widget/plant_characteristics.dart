import 'package:flutter/material.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/expandable_edit_card.dart';

class PlantCharacteristics extends StatelessWidget {
  final String name;

  final String latName;

  final String age;

  final String size;

  final String volume;

  final String lighting;

  final String placement;

  final Function(String charName) onAgeSelect;
  final Function(String charName) onSizeSelect;
  final Function(String charName) onVolumeSelect;
  final Function(String charName) onLightSelect;
  final Function(String charName) onPlacement;

  const PlantCharacteristics({
    Key key,
    this.onAgeSelect,
    this.onSizeSelect,
    this.onVolumeSelect,
    this.onLightSelect,
    this.onPlacement, this.name, this.latName, this.age, this.size, this.volume, this.lighting, this.placement,
  }) : super(key: key);

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
            onSelect: onAgeSelect,
            initialValue: age,
            values: ["1 год", "2 года", "3 года"],
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Размер/Высота",
            onSelect: onSizeSelect,
            initialValue: size,
            values: [
              "20 см",
              "40 см",
              "60 см",
              "80 см",
              "100 см",
              "150 см",
              "200 см"
            ],
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Объем горшка",
            onSelect: onVolumeSelect,
            initialValue: volume,
            values: [
              "1 л",
              "2 л",
              "3 л",
              "4 л",
              "5 л",
              "6 л",
              "8 л",
              "10 л",
              "15 л"
            ],
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Освещение",
            onSelect: onLightSelect,
            initialValue: lighting,
            values: ["У окна", "В комнате"],
          ),
          _buildSeparator(),
          ExpandableCharCard(
            title: "Местоположение",
            onSelect: onPlacement,
            initialValue: placement,
            values: ["Север", "Запад", "Юг", "Восток"],
          ),
        ],
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
