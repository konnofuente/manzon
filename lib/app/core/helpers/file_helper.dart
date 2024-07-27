import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileHelper {
  static File xFileToFile(XFile xfile) {
    return File(xfile.path);
  }
}
