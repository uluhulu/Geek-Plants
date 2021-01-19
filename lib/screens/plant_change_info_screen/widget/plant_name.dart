import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/plant.dart';

class PlantName extends StatelessWidget {
  final String plantName;
  final Function(String name) onChanged;

  const PlantName({
    Key key,
    this.plantName,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        autofocus: false,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: plantName,
          labelStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
