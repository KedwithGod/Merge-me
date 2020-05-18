import 'package:image_picker/image_picker.dart';

class ImageHandling {
  static Future chooseFile(_image) async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      _image = image;
    });
    return _image;
  }
}