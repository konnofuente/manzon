import 'register_state.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  final RegisterState state = RegisterState();

  // Text editing controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers
    fullNameController.addListener(() {
      state.fullName.value = fullNameController.text;
    });
    phoneNumberController.addListener(() {
      state.phoneNumber.value = phoneNumberController.text;
    });
  }

  // Function to handle register action
  void register() {
    // Add your register logic here
    print('Full Name: ${state.fullName.value}');
    print('Phone Number: ${state.phoneNumber.value}');
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
