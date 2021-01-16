import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';

import 'expandable_care_card/expandable_care_card.dart';

class PlantCareCharacteristics extends StatelessWidget {
  final List<Event> events;
  final String plantName;
  final String photoPath;
  final int plantId;

  final Function(List<Event> events) onDaySelected;

  const PlantCareCharacteristics({
    Key key,
    this.events,
    this.onDaySelected,
    this.plantName,
    this.photoPath,
    this.plantId,
  }) : super(key: key);

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
          ExpandableCareCard(
            title: "Полив",
            plantId: plantId,
            plantName: plantName,
            photoPath: photoPath,
            events: events,
            eventType: EventType.watering,
            onDaySelected: (events) {
              onDaySelected(events);
            },
          ),
          _buildSeparator(),
          ExpandableCareCard(
            title: "Увлажнение",
            plantId: plantId,
            plantName: plantName,
            photoPath: photoPath,
            events: events,
            eventType: EventType.wetting,
            onDaySelected: (events) {
              onDaySelected(events);
            },
          ),
          _buildSeparator(),
          ExpandableCareCard(
            title: "Подкормка",
            plantId: plantId,
            plantName: plantName,
            photoPath: photoPath,
            events: events,
            eventType: EventType.feeding,
            onDaySelected: (events) {
              onDaySelected(events);
            },
          ),
          _buildSeparator(),
          ExpandableCareCard(
            title: "Пересадка",
            plantId: plantId,
            plantName: plantName,
            photoPath: photoPath,
            events: events,
            eventType: EventType.transfer,
            onDaySelected: (events) {
              onDaySelected(events);
            },
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
