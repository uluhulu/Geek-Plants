import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/main_screen/main_screen.dart';
import 'package:geek_plants/screens/plant_change_info_screen/plant_change_info_viewmodel.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/cancel_button.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/description_textfield.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_add_photo.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_care.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_characteristics.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_cover/plant_cover.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_name.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/save_button.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/title.dart';

class PlantChangeInfo extends StatefulWidget {
  final Plant plant;

  PlantChangeInfo({@required this.plant});

  @override
  _PlantChangeInfoState createState() => _PlantChangeInfoState();
}

class _PlantChangeInfoState extends State<PlantChangeInfo> {
  PlantChangeInfoViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = PlantChangeInfoViewModel(widget.plant);
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "О растении",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              name: viewModel.name,
              latName: viewModel.latName,
            ),
            _buildSeparator(),
            PlantCover(
              photoPath: viewModel.photoPath,
              onPhotoSelect: (path) {
                setState(
                  () {
                    viewModel.photoPath = path;
                    print('путь ${viewModel.photoPath}');
                  },
                );
              },
            ),
            _buildSeparator(),
            PlantName(
              plantName: viewModel.name,
              onChanged: (name) {
                setState(() {
                  viewModel.name = name;
                });
              },
            ),
            SizedBox(
              height: 8,
            ),
            PlantName(
              plantName: viewModel.latName,
              onChanged: (name) {
                setState(() {
                  viewModel.latName = name;
                });
              },
            ),
            SizedBox(
              height: 8,
            ),
            DescriptionTextField(
              description: viewModel.description,
              onChanged: (descr) {
                setState(() {
                  viewModel.description = descr;
                });
              },
            ),
            PlantCharacteristics(
              age: viewModel.age,
              size: viewModel.size,
              volume: viewModel.volume,
              lighting: viewModel.lighting,
              placement: viewModel.placement,
              onAgeSelect: (age) {
                setState(() {
                  viewModel.age = age;
                });
              },
              onSizeSelect: (size) {
                setState(() {
                  viewModel.size = size;
                });
              },
              onVolumeSelect: (volume) {
                setState(() {
                  viewModel.volume = volume;
                });
              },
              onLightSelect: (light) {
                setState(() {
                  viewModel.lighting = light;
                });
              },
              onPlacement: (placement) {
                setState(() {
                  viewModel.placement = placement;
                });
              },
            ),
            PlantCareCharacteristics(
              events: viewModel.events,
              plantId: viewModel.plantId,
              plantName: viewModel.name,
              photoPath: viewModel.photoPath,
              onDaySelected: (events) {
                setState(() {
                  viewModel.events = events;
                });
                print("евенты ${viewModel.events}");
              },
            ),
            Center(
              child: SaveButton(
                onPressed: () {
                  viewModel.saveChanges();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MainScreen()),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.black12,
      ),
    );
  }
}
