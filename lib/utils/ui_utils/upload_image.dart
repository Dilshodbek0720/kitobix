import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:kitobix/data/models/universal_data/universal_data.dart';
import 'package:kitobix/main.dart';

Future<UniversalData> imageUploader(XFile xFile) async {
  try {
    final fileName = "${DateTime.now().millisecondsSinceEpoch}_${xFile.name}";

    final file = File(xFile.path);
    await supabase.storage.from('images').upload('public/$fileName', file);

    final publicUrl =
        supabase.storage.from('images').getPublicUrl('public/$fileName');

    return UniversalData(data: publicUrl);
  } catch (error) {
    return UniversalData(error: error.toString());
  }
}
