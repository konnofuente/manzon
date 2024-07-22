import 'package:get/get.dart';

class LoginState {
  // Reactive state variables
  RxString phoneNumber = ''.obs;
  RxString password = ''.obs;
  RxString fullNameError = ''.obs;
  RxString phoneNumberError = ''.obs;
}
