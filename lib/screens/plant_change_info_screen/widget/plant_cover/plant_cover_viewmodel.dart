import 'dart:async';

import 'package:image_picker/image_picker.dart';

class PlantCoverViewModel {
  final Function(String path) onPhotoSelect;
  final StreamController<PickedFile> pickedImageController = StreamController();

  PlantCoverViewModel(this.onPhotoSelect);

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source);
    onPhotoSelect.call(image.path);
    pickedImageController.add(image);
  }
}
