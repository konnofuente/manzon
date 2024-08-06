import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateTontineController extends GetxController {
  var tontineName = ''.obs;
  var individualAmount = ''.obs;
  var numberOfMembers = ''.obs;
  var penalty = 'Casier de bieres'.obs;
  var frequency = 'Toutes les semaines'.obs;

  final tontineNameController = TextEditingController();
  final individualAmountController = TextEditingController();
  final numberOfMembersController = TextEditingController();
  final penaltyController = TextEditingController();

  @override
  void onClose() {
    tontineNameController.dispose();
    individualAmountController.dispose();
    numberOfMembersController.dispose();
    penaltyController.dispose();
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
    print("Frequency: ${frequency.value}");
  }
}
