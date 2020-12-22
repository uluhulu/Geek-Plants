import 'package:flutter/material.dart';

import 'expandable_care_card.dart';

class PlantCareCharacteristics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPlantCareCharacteristics();
  }

  Widget _buildPlantCareCharacteristics() {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0, bottom: 76.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 21.0),
            child: Text(
              "Уход",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _buildSeparator(),
          ExpandableCareCard(title: "Полив", values: "АВП", ),
          _buildSeparator(),
          _buildPlantHydration(),
          _buildSeparator(),
          _buildPlantFeeding(),
          _buildSeparator(),
          _buildPlantTransplanting(),
        ],
      ),
    );
  }

  Widget _buildPlantWatering() {
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
              'Полив',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Text(
              'Стандартная настройка',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(0.5),
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

  Widget _buildPlantHydration() {
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
              'Увлажнение',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Spacer(),
            Text(
              'Стандартная настройка',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(0.5),
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

  Widget _buildPlantFeeding() {
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
              'Подкормка',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Spacer(),
            Text(
              '20 января 2021',
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

  Widget _buildPlantTransplanting() {
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
              'Пересадка',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Spacer(),
            Text(
              '07 февраля 2021',
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
