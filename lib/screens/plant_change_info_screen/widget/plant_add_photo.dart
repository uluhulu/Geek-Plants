import 'package:flutter/material.dart';

class PlantAddPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPlantAddPhoto();
  }

  Widget _buildPlantAddPhoto() {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, left: 19, bottom: 58.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 23.0),
            child: Text(
              "Фото",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ),
          GestureDetector(
            child: Container(
              width: 104,
              height: 149,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: IconButton(
                        alignment: Alignment(0.0, 0.0),
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:9.0, left:12,right:12 ),
                    child: Text(
                      "Добавить фото",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
