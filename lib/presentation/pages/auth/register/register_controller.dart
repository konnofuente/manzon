import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/controllers/auth_controller.dart';

class RegisterController extends GetxController {
  final AuthentificationController _authentificationController = Get.find();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String? phoneNumber;
  RxString password = ''.obs;
  RxString fullNameError = ''.obs;
  RxString fullName = ''.obs;
  RxString phoneNumberError = ''.obs;
  RxBool isLoadingButton = false.obs;

  @override
  void onInit() {
    super.onInit();
        phoneNumberController.addListener(() {
      phoneNumber = phoneNumberController.text;
    });
  }

  void register() {
    isLoadingButton(true);
    if (phoneNumber == null) {
      isLoadingButton(false);
      return;
    }
    _authentificationController.verifyPhoneNumber(phoneNumber!);
    isLoadingButton(false);
    print('Full Name: ${fullNameController.text}');
    print('Phone Number: ${phoneNumberController.text}');
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
