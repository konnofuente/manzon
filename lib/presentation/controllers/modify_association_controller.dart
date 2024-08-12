import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/infrastructure/models/association_model.dart';
import 'package:manzon/infrastructure/data_sources/firebase/export_firebase_data_source.dart';

class ModifyAssociationController extends GetxController {
  final AssociationDataSource associationDataSource;

  ModifyAssociationController(this.associationDataSource);

  final TextEditingController associationNameController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController headquarterController = TextEditingController();
    final RxList<String> meetingDays = <String>[].obs;
  // final RxString selectedHeadquarter = ''.obs;
  final RxInt monthlyMeetingFrequency = 1.obs;
  final RxList<String> selectedWeekdays = <String>[].obs;

  final List<String> headquarters = [
    'Yaounde',
    'Douala',
    'Bafoussam',
    'Buea',
  ];

  // Weekdays list
  final List<String> weekdays = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche',
  ];

  @override
  void onInit() {
    super.onInit();
    fetchAssociationDetails();
  }

  void fetchAssociationDetails() {
    
    final association = AssociationModel(
      uniqueId: 'association_id',
      name: 'CERAD',
      headquaterCity: 'Yaounde',
      headquaterLocation: 'Nkomo II',
      monthlyMeetingFrequency: 3,
      meetingDays: ['Vendredi'],
    );

    associationNameController.text = association.name;
    districtController.text = association.headquaterLocation ?? '';
    headquarterController.text = association.headquaterCity ?? '';
    monthlyMeetingFrequency.value = association.monthlyMeetingFrequency ?? 1;
    selectedWeekdays.assignAll(association.meetingDays ?? []);
  }

  void toggleWeekdaySelection(String day) {
    if (selectedWeekdays.contains(day)) {
      selectedWeekdays.remove(day);
    } else {
      selectedWeekdays.add(day);
    }
  }

  void incrementMeetingsPerMonth() {
    if (monthlyMeetingFrequency.value < 7) {
      monthlyMeetingFrequency.value++;
    } else {
      log('Maximum number of meetings per month reached');
    }
  }

  void decrementMeetingsPerMonth() {
    if (monthlyMeetingFrequency.value > 1) {
      monthlyMeetingFrequency.value--;
    } else {
      log('Minimum number of meetings per month reached');
    }
  }

  void updateAssociation() async {
    if (associationNameController.text.isEmpty ||
       
        districtController.text.isEmpty) {
      log('Validation failed: All fields are required');
      return;
    }

   
    final updatedAssociation = AssociationModel(
      uniqueId: 'association_id',
      name: associationNameController.text,
      headquaterCity: headquarterController.text,
      headquaterLocation: districtController.text,
      monthlyMeetingFrequency: monthlyMeetingFrequency.value,
      meetingDays: selectedWeekdays.toList(),
      tontines: [],
      paymentFrequency: '', 
      balance: 0.0,
      loanConditions: '',
      transactions: [], 
      members: [],
      membersId: [],
      avatar: null,
    );

    await associationDataSource.updateAssociation(updatedAssociation);

    log('Association updated successfully');
    Get.back();
  }

  @override
  void onClose() {
    associationNameController.dispose();
    districtController.dispose();
    super.onClose();
  }
}
