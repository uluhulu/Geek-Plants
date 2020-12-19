 import 'package:flutter/material.dart';
class PlantCharacteristics extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _buildPlantsCharacteristics();
  }
  Widget _buildPlantsCharacteristics(){
    return Padding(
      padding: const EdgeInsets.only(left : 19.0, bottom: 63.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 21.0),
            child: Text(
              "Характеристики",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          _buildSeparator(),
          _buildPlantAge(),
          _buildSeparator(),
          _buildPlantSize(),
          _buildSeparator(),
          _buildPlantPotVolume(),
          _buildSeparator(),
          _buildPlantLighting(),
          _buildSeparator(),
          _buildPlantLocation(),

        ],
      ),
    );
  }
  Widget _buildPlantAge(){
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, bottom: 23.0, right: 15.0,),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Возраст',
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

  Widget _buildPlantSize(){
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, bottom: 23.0, right: 15.0,),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Размер/Высота',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
              ),
            ),
            Spacer(
            ),
            Text(
              'Маленький(30см)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.5)),
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

  Widget _buildPlantPotVolume(){
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, bottom: 23.0, right: 15.0,),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Объем горшка',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
              ),
            ),
            Spacer(
            ),
            Text(
              '2 л',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.5)),
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

  Widget _buildPlantLighting(){
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, bottom: 23.0, right: 15.0,),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Освещение',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
              ),
            ),
            Spacer(
            ),
            Text(
              'У окна',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.5)),
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

  Widget _buildPlantLocation(){
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, bottom: 23.0, right: 15.0,),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              'Местоположение',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
              ),
            ),
            Spacer(
            ),
            Text(
              'Север',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.5)),
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

