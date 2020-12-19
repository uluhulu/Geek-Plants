import 'package:flutter/material.dart';

class PlantCover extends StatelessWidget {
  final String photoPath;

  const PlantCover({Key key, this.photoPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPlantCover();
  }

  Widget _buildPlantCover() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 19.0, top: 19.0, bottom: 19.0, right: 15.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(photoPath),
              radius: 52,
            ),
            Spacer(
            ),
            Opacity(
              opacity: 0.5,
              child: Text(
                'Изменить обложку',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
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
