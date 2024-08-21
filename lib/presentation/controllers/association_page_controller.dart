import 'dart:developer';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:manzon/app/core/helpers/export_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:manzon/domain/entities/tontine_entity.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/infrastructure/data_sources/firebase/tontine_data_source.dart';


class AssociationController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  var tontines = <TontineEntity>[].obs;
  var members = <MemberEntity>[].obs;
  var contributions = <AssociationContributionEntity>[].obs;
  var contacts = <Contact>[].obs;
  var selectedContacts = <Contact>[].obs;
  var searchQuery = ''.obs;
  var filteredContacts = <Contact>[].obs;
    String associationId = '';
  final TontineDataSource tontineDataSource = TontineDataSource();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
     final StateController stateController = Get.find();
    associationId = stateController.selectedAssociationId.value;
    fetchTontinesByAssociation(associationId);
    // _generateFakeMembers();
    fetchFakeContributions();
    fetchContacts();

    // Listen to changes in search query and filter contacts
    ever(searchQuery, (_) => filterContacts());
  }

  void fetchContacts() async {
    PermissionStatus permissionStatus = await getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Iterable<Contact> contactsIterable = await ContactsService.getContacts();
      contacts.value = contactsIterable.toList();
      filteredContacts.value = contacts; // Initially, all contacts are shown
    } else {
      print("Contacts permission not granted");
    }
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

  void addSelectedContactsToMembers() {
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
      members.add(member);
      Get.back();
    }
  }


 Future<void> fetchTontinesByAssociation(String associationId) async {
    try {
      final tontineList = await tontineDataSource.getTontinesByAssociationId(associationId);
      tontines.assignAll(tontineList);
    } catch (e) {
      log('Error fetching tontines: $e');
    }
  }

  void _generateFakeMembers() {
    members.value = List.generate(5, (index) {
      return MemberEntity(
        id: 'member$index',
        name: 'Elisabeth Singou',
        role: 'Member',
        userId: 'user$index',
        phoneNumber: '+237 699 442 188',
      );
    });
  }

  void fetchFakeContributions() {
    contributions.value = List.generate(
      5,
      (index) => AssociationContributionEntity(
        id: 'id_$index',
        name: 'Contribution $index',
        associationId: 'association_id_$index',
        members: ['member1', 'member2'],
        balance: 100000.0,
        contributionFrequency: 'mois',
        contributionAmount: 1000000.0,
        cycleDuration: '1 mois',
        currentCycle: index,
        transactions: [],
      ),
    );
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
