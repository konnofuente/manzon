import 'package:get/get.dart';

class LoginState {
  // Reactive state variables
  RxString fullName = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString fullNameError = ''.obs;
  RxString phoneNumberError = ''.obs;
}
