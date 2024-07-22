import 'login_state.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();

  // Text editing controllers
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers
    passwordController.addListener(() {
      state.password.value = passwordController.text;
    });
    phoneNumberController.addListener(() {
      state.phoneNumber.value = phoneNumberController.text;
    });
  }

  // Function to handle login action
  void login() {
    // Add your login logic here
    print('Phone Number: ${state.phoneNumber.value}');
    print('password: ${state.password.value}');
  }

  @override
  void onClose() {
    passwordController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
