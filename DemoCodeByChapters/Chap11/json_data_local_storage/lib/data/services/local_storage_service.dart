import 'dart:convert';
import 'dart:io';
import '../../utils/file_utils.dart';

class LocalStorageService {
  Future<void> saveJson(List<Map<String, dynamic>> data) async {
    final path = await getFilePath();
    final file = File(path);
    await file.writeAsString(jsonEncode(data));
  }

  Future<List<dynamic>> readJson() async {
    final path = await getFilePath();
    final file = File(path);

    if (await file.exists()) {
      final content = await file.readAsString();
      return jsonDecode(content);
    }
    return [];
  }
}
