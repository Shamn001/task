import 'package:hive/hive.dart';
import '../../users/models/user_model.dart';

class UserRepository {
  final Box<User> _box = Hive.box<User>('users');

  List<User> getAllUsers() {
    return _box.values.toList();
  }

  void addUser(User user) {
    _box.add(user);
  }

  void deleteUser(int index) {
    _box.deleteAt(index);
  }

  void updateUser(int index, User user) {
    _box.putAt(index, user);
  }
}
