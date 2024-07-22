import 'login_state.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();

  // Functions to handle changes
  void updateFullName(String value) {
    state.fullName.value = value;
  }

  void updatePhoneNumber(String value) {
    state.phoneNumber.value = value;
  }

  // Function to handle login action
  void login() {
    // Add your login logic here
    print('Full Name: ${state.fullName.value}');
    print('Phone Number: ${state.phoneNumber.value}');
  }
}
