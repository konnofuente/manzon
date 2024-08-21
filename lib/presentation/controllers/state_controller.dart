import 'dart:developer';
import 'package:get/get.dart';


class StateController extends GetxController {
  // Example: Association ID
  var selectedAssociationId = ''.obs;

  // Example: User ID
  var userId = ''.obs;

  // Example: Any other lightweight data you want to store
  var selectedTontineId = ''.obs;
  var isLoggedIn = false.obs;

  // Function to update the selected Association ID
  void setSelectedAssociationId(String id) {
    selectedAssociationId.value = id;
    log('this is the asociation Id $id');
  }
  void clearAssociationId() {
    selectedAssociationId.value = '';
    log('asssociation id cleared');
  }

  // Function to update the User ID
  void setUserId(String id) {
    userId.value = id;
  }

  // Function to update Tontine ID
  void setSelectedTontineId(String id) {
    selectedTontineId.value = id;
  }

  // Function to toggle login state
  void toggleLoginState(bool state) {
    isLoggedIn.value = state;
  }

  // Add other state management methods as needed...
}
