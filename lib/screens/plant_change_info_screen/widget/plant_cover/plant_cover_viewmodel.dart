import 'dart:async';

import 'package:image_picker/image_picker.dart';

class PlantCoverViewModel {
  final StreamController<PickedFile> pickedImageController = StreamController();

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source);

    pickedImageController.add(image);
  }
}
