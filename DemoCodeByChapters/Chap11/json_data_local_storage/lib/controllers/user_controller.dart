import '../data/models/user.dart';
import '../data/repository/user_repository.dart';

class UserController {
  final UserRepository _repo = UserRepository();

  Future<List<User>> loadUsers() async {
    List<User> users = await _repo.getUsers();

    if (users.isEmpty) {
      users = [
        User(id: 1, name: 'An', age: 20),
        User(id: 2, name: 'Binh', age: 22),
        User(id: 3, name: 'Cuong', age: 21),
        User(id: 4, name: 'Dung', age: 23),
        User(id: 5, name: 'Hanh', age: 19),
      ];
      await _repo.saveUsers(users);
    }

    return users;
  }
}
