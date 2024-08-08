import 'dart:developer';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:manzon/app/core/helpers/export_helper.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';
import 'package:manzon/infrastructure/data_sources/firebase/tontine_data_source.dart';

class CreateTontineController extends GetxController {
  final PageController pageController = PageController();
  final TontineDataSource tontineDataSource;
  final int totalStep = 5;
  final RxInt currentStep = 0.obs;
  var searchQuery = ''.obs;
  var contacts = <Contact>[].obs;
  var filteredContacts = <Contact>[].obs;
  var selectedContacts = <Contact>[].obs;

  // Step 1: Select Members
  final RxList<MemberEntity> selectedMembers = <MemberEntity>[].obs;

  // Step 2: Order Members
  final RxList<int> memberOrder = <int>[].obs;

  // Step 3: Tontine Information
  final TextEditingController tontineNameController = TextEditingController();
  final TextEditingController individualAmountController =
      TextEditingController();
  final TextEditingController numberOfMembersController =
      TextEditingController();

  // Step 4: Financial Information
  final RxString penaltyType = 'Pourcentage'.obs;
  final TextEditingController penaltyAmountController = TextEditingController();
  final Rx<ContributionFrequency> contributionFrequency =
      ContributionFrequency.weekly.obs;
  final Rx<ReceiverFrequency> receiverFrequency = ReceiverFrequency.monthly.obs;

  CreateTontineController(this.tontineDataSource);

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in search query and filter contacts
    ever(searchQuery, (_) => filterContacts());
  }

  void filterContacts() {
    if (searchQuery.value.isEmpty) {
      filteredContacts.value = contacts;
    } else {
      filteredContacts.value = contacts.where((contact) {
        final name = contact.displayName?.toLowerCase() ?? '';
        final query = searchQuery.value.toLowerCase();
        return name.contains(query);
      }).toList();
    }
  }

  void fetchContacts() async {
    PermissionStatus permissionStatus = await getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Iterable<Contact> contactsIterable = await ContactsService.getContacts();
      contacts.value = contactsIterable.toList();
      filteredContacts.value = contacts;
    } else {
      print("Contacts permission not granted");
    }
  }

  void addSelectedContactsToMembers() {
    if (selectedContacts.isEmpty) {
      log('No contacts selected'); // Log or handle the empty state as needed
      Get.toNamed(AppRouteNames.createTontinePage);
      return; // Exit the function if there are no selected contacts
    }

    for (var contact in selectedContacts) {
      final member = MemberEntity(
        id: Uuid().v4(),
        name: contact.displayName ?? '',
        role: 'Member',
        userId: contact.identifier ?? '',
        phoneNumber: contact.phones?.isNotEmpty ?? false
            ? contact.phones!.first.value!
            : '',
      );
      selectedMembers.add(member);
      log('clicked');
      Get.toNamed(AppRouteNames.createTontinePage);
      // Get.back();
    }
  }

  void nextStep() {
    if (currentStep.value < totalStep - 1) {
      currentStep.value++;
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
      pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void updateOrder(int index, int order) {
    memberOrder[index] = order;
  }

  TextEditingController getOrderController(int index) {
    final controller = TextEditingController();
    controller.text = memberOrder[index].toString();
    return controller;
  }

  void updatePenaltyType(String value) {
    penaltyType.value = value;
  }

  void updateContributionFrequency(ContributionFrequency value) {
    contributionFrequency.value = value;
  }

  void updateReceiverFrequency(ReceiverFrequency value) {
    receiverFrequency.value = value;
  }

  void createTontine() async {
    final tontine = TontineModel(
      id: Uuid().v4(),
      name: tontineNameController.text,
      contributionAmount: double.parse(individualAmountController.text),
      contributionFrequency: contributionFrequency.value,
      receiverFrequency: receiverFrequency.value,
      members: selectedMembers.map((e) => e as MemberModel).toList(),
      membersId: selectedMembers.map((m) => m.id).toList(),
      orderList: selectedMembers.map((e) => e as MemberModel).toList(),
      cycles: [],
      associationId: 'association_id', // Replace with actual association ID
      cycleDuration: 4, // Example value, replace with actual cycle duration
      currentCycle: 0,
    );

    await tontineDataSource.addTontine(tontine);
    Get.back();
  }
}
