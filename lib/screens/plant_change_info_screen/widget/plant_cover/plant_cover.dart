import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/plant_cover/plant_cover_viewmodel.dart';
import 'package:image_picker/image_picker.dart';

class PlantCover extends StatefulWidget {
  final String photoPath;

  const PlantCover({Key key, this.photoPath}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PlantCoverState();
  }
}

class PlantCoverState extends State<PlantCover> {
  final PlantCoverViewModel viewModel = PlantCoverViewModel();

  @override
  Widget build(BuildContext context) {
    return _buildPlantCover();
  }

  Widget _buildPlantCover() {
    File _image;
    return Padding(
      padding: const EdgeInsets.only(
          left: 19.0, top: 19.0, bottom: 19.0, right: 15.0),
      child: GestureDetector(
        onTap: () {
          final action = CupertinoActionSheet(
            title: Text(
              "Изменить обложку",
              style: TextStyle(fontSize: 18),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text("Камера"),
                isDefaultAction: true,
                onPressed: () async{
                  await viewModel.getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                child: Text("Галлерея"),
                isDefaultAction: true,
                onPressed: () async{
                  Navigator.pop(context);
                 await viewModel.getImage(ImageSource.gallery);
                },
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text("Отмена"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
          showCupertinoModalPopup(
              context: context, builder: (context) => action);
        },
        child: Row(
          children: [
            StreamBuilder<PickedFile>(
                stream: viewModel.pickedImageController.stream,
                builder: (context, snapshot) {
                  final image = snapshot.data;
                  return CircleAvatar(
                    backgroundImage: image == null
                        ? AssetImage(widget.photoPath)
                        : FileImage(File(image.path)),
                    radius: 52,
                  );
                }),
            Spacer(),
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
