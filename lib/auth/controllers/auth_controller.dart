import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/auth_model.dart';

class AuthController extends ChangeNotifier {
  final Box<UserModel> authBox = Hive.box<UserModel>('user');

  static const String mockOtp = "123456";

  String? _phone;

  String? get phone => _phone;
  bool get isLoggedIn => authBox.get('currentUser')?.isLoggedIn ?? false;

  void sendOtp(String phone) {
    _phone = phone;
    authBox.put('currentUser', UserModel(phone: phone, isLoggedIn: false));
    print("OTP sent to $phone");
    print("Mock OTP is $mockOtp");
    notifyListeners();
  }

  bool verifyOtp(String enteredOtp) {
    if (enteredOtp == mockOtp && _phone != null) {
      authBox.put('currentUser', UserModel(phone: _phone!, isLoggedIn: true));
      notifyListeners(); // rebuild UI
      return true;
    }
    return false;
  }

  void logout() {
    final user = authBox.get('currentUser');
    if (user != null) {
      user.isLoggedIn = false;
      user.save();
    }
    notifyListeners();
  }
}
