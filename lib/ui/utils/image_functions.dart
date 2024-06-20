import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageFunctions {
  static Future<File?> cameraPicker() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static Future<File?> galleryPicker() async {
    // PermissionStatus status;
    // if (Platform.isAndroid) {
    //   final androidInfo = await DeviceInfoPlugin().androidInfo;
    //   if (androidInfo.version.sdkInt <= 32) {
    //     status = await Permission.storage.request();
    //   }
    //   else {
    //     status = await Permission.phone.request();
    //   }
    // } else {
    //   status = await Permission.phone.request();
    // }
    // if (status.isGranted) {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    // }
    return null;
  }
}
