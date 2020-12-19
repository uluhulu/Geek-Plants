import 'package:flutter/material.dart';

class PlantName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPlantName();
  }

  Widget _buildPlantName() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 19.0, top: 23.0, bottom: 23.0, right: 15.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Имя',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: Colors.black
              ),
            ),
            Spacer(
            ),
            Opacity(
              opacity: 0.5,
              child: Text(
                'Нет',
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
}
