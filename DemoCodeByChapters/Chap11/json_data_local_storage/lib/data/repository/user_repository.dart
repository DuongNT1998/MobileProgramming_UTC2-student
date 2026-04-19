import '../models/user.dart';
import '../services/local_storage_service.dart';

class UserRepository {
  final LocalStorageService _service = LocalStorageService();

  Future<List<User>> getUsers() async {
    final data = await _service.readJson();
    return data.map<User>((e) => User.fromJson(e)).toList();
  }

  Future<void> saveUsers(List<User> users) async {
    final jsonData = users.map((e) => e.toJson()).toList();
    await _service.saveJson(jsonData);
  }
}
