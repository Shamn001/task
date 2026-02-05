import 'package:test/core/constrains/api_constrains.dart';

class AuthController {
  final String baseUrl = ApiConstants.baseUrl;

  static const String mockOtp = "123456";

  String? _phone;

  void sendOtp(String phone) {
    _phone = phone;
    print("OTP sent to $phone");
    print("Mock OTP is $mockOtp");
  }

  bool verifyOtp(String enteredOtp) {
    return enteredOtp == mockOtp;
  }

  String? get phone => _phone;
}
