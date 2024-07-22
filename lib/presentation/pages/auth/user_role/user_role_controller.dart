import 'package:get/get.dart';

class UserRoleController extends GetxController {
  var selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }
}
