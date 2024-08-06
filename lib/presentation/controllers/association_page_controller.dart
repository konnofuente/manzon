import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:manzon/domain/entities/tontine_entity.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

class AssociationController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  var tontines = <TontineEntity>[].obs;
  var members = <MemberEntity>[].obs;
  var contributions = <ContributionEntity>[].obs;
  var contacts = <Contact>[].obs;
  var selectedContacts = <Contact>[].obs;
  var searchQuery = ''.obs;
  var filteredContacts = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    _generateFakeTontines();
    // _generateFakeMembers();
    fetchFakeContributions();
    fetchContacts();

    // Listen to changes in search query and filter contacts
    ever(searchQuery, (_) => filterContacts());
  }

  void fetchContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Iterable<Contact> contactsIterable = await ContactsService.getContacts();
      contacts.value = contactsIterable.toList();
      filteredContacts.value = contacts; // Initially, all contacts are shown
    } else {
      print("Contacts permission not granted");
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> permissionStatus = await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.denied;
    } else {
      return permission;
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
        phoneNumber: contact.phones?.isNotEmpty ?? false ? contact.phones!.first.value! : '',
      );
      members.add(member);
       Get.back();
    }
  }

  void _generateFakeTontines() {
    tontines.value = List.generate(15, (index) {
      return TontineEntity(
        uniqueId: Uuid().v4(),
        name: 'Tontine ${index + 1}',
        associationId: 'fake_association_id',
        members: ['user1', 'user2', 'user3'],
        balance: 100000 * (index + 1).toDouble(),
        contributionFrequency: 'mois',
        contributionAmount: 1000 * (index + 1).toDouble(),
        cycleDuration: 12,
        currentCycle: index + 1,
        transactions: [],
      );
    });
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
      (index) => ContributionEntity(
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
