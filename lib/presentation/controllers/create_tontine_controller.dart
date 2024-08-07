import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateTontineController extends GetxController {
  var tontineName = ''.obs;
  var individualAmount = ''.obs;
  var numberOfMembers = ''.obs;
  var penalty = 'Casier de bieres'.obs;
  var frequency = 'Toutes les semaines'.obs;
  var fixedPenaltyAmount = ''.obs; // New observable

  final tontineNameController = TextEditingController();
  final individualAmountController = TextEditingController();
  final numberOfMembersController = TextEditingController();
  final penaltyController = TextEditingController();
  final fixedPenaltyAmountController =
      TextEditingController(); // New controller

  @override
  void onClose() {
    tontineNameController.dispose();
    individualAmountController.dispose();
    numberOfMembersController.dispose();
    penaltyController.dispose();
    fixedPenaltyAmountController.dispose(); // Dispose new controller
    super.onClose();
  }

  void updateFrequency(String value) {
    frequency.value = value;
  }

  void submit() {
    print("Tontine Name: ${tontineNameController.text}");
    print("Individual Amount: ${individualAmountController.text}");
    print("Number of Members: ${numberOfMembersController.text}");
    print("Penalty: ${penalty.value}");
    if (penalty.value == 'Montant fixe') {
      print("Fixed Penalty Amount: ${fixedPenaltyAmountController.text}");
    }
    print("Frequency: ${frequency.value}");
    Get.back();
  }
}
