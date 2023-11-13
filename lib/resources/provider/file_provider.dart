import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FileProvider {
  static Future<Uint8List?> getImageFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: "Seleziona immagine da allegare",
      type: FileType.image,
    );

    return result?.files.first.bytes;
  }
}
