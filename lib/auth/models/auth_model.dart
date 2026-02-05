import 'package:hive/hive.dart';

part 'auth_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String phone;

  @HiveField(1)
  bool isLoggedIn;

  UserModel({required this.phone, required this.isLoggedIn});
}
