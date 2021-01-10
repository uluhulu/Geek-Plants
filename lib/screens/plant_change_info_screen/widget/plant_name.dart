import 'package:flutter/material.dart';

class PlantName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
          labelText: "Имя",
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
