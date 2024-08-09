import 'dart:developer';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';
import 'package:manzon/infrastructure/data_sources/firebase/tontine_data_source.dart';

class CreateTontineController extends GetxController {
  final PageController pageController = PageController();
  final TontineDataSource tontineDataSource;
  final int totalStep = 4;
  final RxInt currentStep = 0.obs;
  var searchQuery = ''.obs;
  var contacts = <Contact>[].obs;
  var filteredContacts = <Contact>[].obs;
  var selectedContacts = <Contact>[].obs;
  final RxBool orderVerficication = true.obs;

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
  // final RxString penaltyType = 'Pourcentage'.obs;
  final Rx<PenaltyType> penaltyType = PenaltyType.fixAmount.obs;
  final TextEditingController penaltyAmountController = TextEditingController();
  final Rx<ContributionFrequency> contributionFrequency =
      ContributionFrequency.weekly.obs;
  final Rx<ReceiverFrequency> receiverFrequency = ReceiverFrequency.monthly.obs;

  CreateTontineController(this.tontineDataSource);

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in search query and filter contacts
    fetchContacts();
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

  Future<PermissionStatus> getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.denied;
    } else {
      return permission;
    }
  }

  void addSelectedContactsToMembers() {
    if (selectedContacts.isEmpty) {
      log('No contacts selected'); // Log or handle the empty state as needed
      Get.toNamed(AppRouteNames.createTontinePage);
      return; // Exit the function if there are no selected contacts
    }

    selectedMembers.clear();
    selectedContacts.forEach((contact) {
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
    });
    memberOrder.assignAll(
        List<int>.generate(selectedMembers.length, (index) => index + 1));
    Get.toNamed(AppRouteNames.createTontinePage);
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
    if (order > selectedMembers.length || order < 0) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ToastUtils.showError(Get.context!, "Invalid Order",
            "Order must be between 1 and ${selectedMembers.length}.");
      });
      orderVerficication(false);
      return;
    }

    // if (memberOrder.contains(order)) {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //     ToastUtils.showError(Get.context!, "Duplicate Order",
    //         "This order number has already been assigned.");
    //   });
    //   orderVerficication(false);
    //   return;
    // }

    orderVerficication(true);
    memberOrder[index] = order;
  }

  bool validateOrder() {
    bool isValid = true;
    for (int order in memberOrder) {
      if (order == 0 ||
          order > selectedMembers.length ||
          memberOrder.where((e) => e == order).length > 1) {
        isValid = false;
        break;
      }
    }

    if (!isValid) {
      ToastUtils.showError(Get.context!, "Verification",
          "The is an error of order in your list.");
      return false;
    }

    return isValid;
  }

  TextEditingController getOrderController(int index) {
    final controller = TextEditingController();
    if (index < memberOrder.length) {
      controller.text = memberOrder[index].toString();
    }
    return controller;
  }

  void updatePenaltyType(PenaltyType value) {
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
