import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:manzon/domain/entities/tontine_entity.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

class AssociationController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  var tontines = <TontineEntity>[].obs;
  var members = <MemberEntity>[].obs;
  var contributions = <ContributionEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    _generateFakeTontines();
    _generateFakeMembers();
    fetchFakeContributions();
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

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
