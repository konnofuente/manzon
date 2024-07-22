import 'package:get/get.dart';

class RegisterState {
  // Reactive state variables
  RxString fullName = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString fullNameError = ''.obs;
  RxString phoneNumberError = ''.obs;
}
