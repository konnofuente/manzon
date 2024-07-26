import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateAssociationController extends GetxController {
  var currentStep = 0.obs;
  final pageController = PageController();

  // Form data
  var associationName = ''.obs;
  var location = ''.obs;
  var district = ''.obs;
  var meetingFrequency = 3.obs;
  var meetingDays = <String>[].obs;
   var imagePath = ''.obs;

     final TextEditingController associationNameController = TextEditingController();
  final TextEditingController headquaterTownController = TextEditingController();
  final TextEditingController headquaterLocationController = TextEditingController();

  void nextStep() {
    if (currentStep.value < 4) {
      currentStep.value++;
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
      pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
