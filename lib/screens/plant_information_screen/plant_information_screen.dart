import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/plant_change_info_screen/plant_change_info_screen.dart';
import 'package:geek_plants/screens/plant_information_screen/widget/card_calendar.dart';
import 'package:geek_plants/screens/plant_information_screen/widget/expandable_info_card.dart';

class PlantInformation extends StatefulWidget {
  final Plant plant;

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
                if (widget.plant.isSelected) _buildSettingsButton(),
                _buildNameCard(widget.plant),
              ],
            ),
            _buildDescription(widget.plant.description),
            _buildInfoList(),
            _buildPlantInfoContainer()
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
            onPressed: () {
              Navigator.pop(context);
            },
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlantChangeInfo(plant: widget.plant)),
              );
            },
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
          children: [
            _buildWateringCard(),
            _buildMoisteningCard(),
            _buildFeedingCard(),
            _buildTransplantingCard()
          ],
        ),
      ),
    );
  }

  Widget _buildWateringCard() {
    return CardCalendar(
      title: "Полив",
      image: "assets/vector/wector_watering.png",
      events: widget.plant.events,
      type: EventType.watering,
    );
  }

  Widget _buildMoisteningCard() {
    return CardCalendar(
      title: "Увлажнение",
      image: "assets/vector/vector_moistening.png",
      events: widget.plant.events,
      type: EventType.wetting,
    );
  }

  Widget _buildFeedingCard() {
    return CardCalendar(
      title: "Подкормка",
      image: "assets/vector/vector_feeding.png",
      events: widget.plant.events,
      type: EventType.feeding,
    );
  }

  Widget _buildTransplantingCard() {
    return CardCalendar(
      title: "Пересадка",
      image: "assets/vector/vector_transplanting.png",
      events: widget.plant.events,
      type: EventType.transfer,
    );
  }

  Widget _buildPlantInfoContainer() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _buildSeparator(),
          InfoCard(
            title: "Возраст",
            info: widget.plant.age,
          ),
          _buildSeparator(),
          InfoCard(
            title: "Размер/Высота",
            info: widget.plant.size,
          ),
          _buildSeparator(),
          InfoCard(
            title: "Объем горшка",
            info: widget.plant.volume,
          ),
          _buildSeparator(),
          InfoCard(
            title: "Освещение",
            info: widget.plant.lighting,
          ),
          _buildSeparator(),
          InfoCard(
            title: "Местоположение",
            info: widget.plant.placement,
          ),
          _buildSeparator(),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 18,
      ),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.black12,
      ),
    );
  }
}
