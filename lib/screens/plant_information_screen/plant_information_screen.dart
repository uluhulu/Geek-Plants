import 'package:flutter/material.dart';
import 'package:geek_plants/model/plant.dart';

class PlantInformation extends StatefulWidget {
  Plant plant;

  PlantInformation({@required this.plant});

  @override
  _PlantInformationState createState() => _PlantInformationState();
}

class _PlantInformationState extends State<PlantInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                _buildPlantImage(widget.plant.photoPath),
                _buildBackButton(),
                _buildSettingsButton(),
                _buildNameCard(widget.plant),
              ],
            ),
            _buildDescription(widget.plant.description),
            _buildInfoList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: 600,
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: ButtonTheme(
          minWidth: 53,
          height: 50,
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
              right: Radius.circular(29.0),
            )),
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Align(
        alignment: Alignment.topRight,
        child: ButtonTheme(
          minWidth: 53,
          height: 50,
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
              left: Radius.circular(29.0),
            )),
            child: Icon(Icons.tune),
          ),
        ),
      ),
    );
  }

  Widget _buildNameCard(Plant plant) {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 19.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: 112,
          width: 260,
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 25, right: 26),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      plant.latName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 41.0, left: 44.0, right: 37.0),
        child: Text(
          description,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoList() {
    return Padding(
      padding: const EdgeInsets.only(top: 27.0),
      child: Container(
        width: 375,
        height: 342,
        child: ListView(
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          children: [
            _buildWateringCard(),
            _buildMoisteningCard(),],
        ),
      ),
    );
  }

  Widget _buildWateringCard() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 234,
        height: 300,
        child: Card(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top:40.0,left: 26),
                    child: Row(
                      children: [
                        Text(
                          "Полив",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 18 ,
                        ),
                        Image.asset("assets/vector/wector_watering.png",width: 13,height: 16.9,),
                      ]
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left: 26.0, right: 31.0),
                child: Text(
                  "Летом 1 раз в неделю, Зимой каждые 10 – 15 дней",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:23.0,left: 26.0, right: 110.0),
                child: Text(
                  "Последний полив 20 января",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w200,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildMoisteningCard() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 234,
        height: 300,
        child: Card(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top:40.0,left: 26),
                    child: Row(
                        children: [
                          Text(
                            "Увлажнение",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 18 ,
                          ),
                          Image.asset("vector_moistening.png",width: 13,height: 16.9,),
                        ]
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left: 26.0, right: 31.0),
                child: Text(
                  "Летом 1 раз в неделю, Зимой каждые 10 – 15 дней",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:23.0,left: 26.0, right: 110.0),
                child: Text(
                  "Последнее увлажнение 18 января",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w200,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
