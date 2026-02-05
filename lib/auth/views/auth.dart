import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/auth/controllers/auth_controller.dart';
import 'package:test/auth/views/otp_verify.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<bool> isButtonEnabled = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                    child: Image.asset(
                      'assets/images/object1.png',
                      height: 140,
                    ),
                  ),
                ),

                const Text(
                  "Enter Phone Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 10),

                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: (value) {
                    isButtonEnabled.value = value.length == 10;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hint: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: " Enter Phone Number",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.2,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    children: [
                      const TextSpan(
                        text: "By continuing, I agree to TotalX’s ",
                      ),
                      const TextSpan(
                        text: "Terms and condition",
                        style: TextStyle(color: Colors.blue),
                      ),
                      const TextSpan(text: " & "),
                      const TextSpan(
                        text: "privacy policy",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                ValueListenableBuilder<bool>(
                  valueListenable: isButtonEnabled,
                  builder: (context, enebled, _) {
                    return GestureDetector(
                      onTap: enebled
                          ? () {
                              AuthController().sendOtp(phoneController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpVerify(),
                                ),
                              );
                            }
                          : null,
                      child: Container(
                        height: 44,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: enebled ? Colors.black : Colors.black26,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "Get OTP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
