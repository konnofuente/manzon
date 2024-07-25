import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  // Text editing controllers
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  RxString phoneNumber = ''.obs;
  RxString password = ''.obs;
  RxString fullNameError = ''.obs;
  RxString phoneNumberError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers
    passwordController.addListener(() {
      password.value = passwordController.text;
    });
    phoneNumberController.addListener(() {
      phoneNumber.value = phoneNumberController.text;
    });
  }

  // Function to handle login action
  void login() {
    // Add your login logic here
    print('Phone Number: ${phoneNumber.value}');
    print('password: ${password.value}');
  }

  @override
  void onClose() {
    passwordController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
