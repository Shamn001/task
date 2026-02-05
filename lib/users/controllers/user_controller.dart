import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../../data/repositories/user_repo.dart';

class UserController extends ChangeNotifier {
  final UserRepository _repo = UserRepository();

  List<User> users = [];
  String currentSort = 'All';

  UserController() {
    loadUsers();
  }

  void loadUsers() {
    users = _repo.getAllUsers();
    notifyListeners();
  }

  void addUser(String name, int age) {
    _repo.addUser(User(name: name, age: age));
    loadUsers();
  }

  void deleteUser(int index) {
    _repo.deleteUser(index);
    loadUsers();
  }

  void sortUsers(String? sort) {
    currentSort = sort ?? 'All';

    if (currentSort == 'Age: Elder') {
      users.sort((a, b) => b.age.compareTo(a.age));
    } else if (currentSort == 'Age: Older') {
      users.sort((a, b) => a.age.compareTo(b.age));
    } else {
      loadUsers();
      return;
    }

    notifyListeners();
  }
}
