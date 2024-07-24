import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/controllers/auth_controller.dart';

class RegisterController extends GetxController {
  final AuthentificationController _authentificationController = Get.find();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  RxString phoneNumber = ''.obs;
  RxString password = ''.obs;
  RxString fullNameError = ''.obs;
  RxString fullName = ''.obs;
  RxString phoneNumberError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers
    fullNameController.addListener(() {
      fullName.value = fullNameController.text;
    });
    phoneNumberController.addListener(() {
      phoneNumber.value = phoneNumberController.text;
    });
  }

  void register() {
    _authentificationController.verifyPhoneNumber(phoneNumberController.text);
    // Add your register logic here
    print('Full Name: ${fullName.value}');
    print('Phone Number: ${phoneNumber.value}');
    // Get.toNamed(AppRouteNames.otp);
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
