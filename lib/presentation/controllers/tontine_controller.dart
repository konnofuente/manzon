import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // For generating unique IDs
import 'package:manzon/infrastructure/models/cycle_model.dart';
import 'package:manzon/infrastructure/models/member_model.dart';
import 'package:manzon/infrastructure/mappers/cycle_mapper.dart';
import 'package:manzon/infrastructure/models/tontine_model.dart';
import 'package:manzon/infrastructure/mappers/member_mapper.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/infrastructure/models/tontine_contribution_model.dart';
import 'package:manzon/infrastructure/data_sources/firebase/tontine_data_source.dart';

class TontineController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  String associationId = '';
  final TontineDataSource tontineDataSource = TontineDataSource();

  // Fake TontineModel for testing
  TontineModel tontine = TontineModel(
    id: '12345',
    name: 'Monthly Savings Group',
    contributionAmount: 50000.0,
    contributionFrequency: ContributionFrequency.monthly,
    receiverFrequency: ReceiverFrequency.monthly,
    members: [
      MemberModel(id: '1', name: 'Elisabeth Singou', role: 'Member', userId: 'u1', phoneNumber: '+237 699 442 188'),
      MemberModel(id: '2', name: 'John Doe', role: 'Member', userId: 'u2', phoneNumber: '+237 688 123 456'),
      MemberModel(id: '3', name: 'Jane Smith', role: 'Member', userId: 'u3', phoneNumber: '+237 677 654 321'),
    ],
    associationId: 'assoc1',
    cycleDuration: 4,
    currentCycle: 1,
    cycles: [],
  );

  int currentCycleIndex = 0; // Track the current cycle

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    final StateController stateController = Get.find();
    associationId = stateController.selectedAssociationId.value;

    // Generate fake cycles and contributions for testing
    _generateFakeCycles();
  }

  void _generateFakeCycles() {
    final DateTime now = DateTime.now();
    DateTime startDate = now;
    final List<CycleModel> cycles = [];

    // Generate cycles based on the number of members and cycle duration
    for (int i = 0; i < tontine.members!.length; i++) {
      final MemberModel receiver = MemberMapper.toModel(tontine.members![i])  ;
      final DateTime endDate = startDate.add(_getDuration(tontine.contributionFrequency));

      // Generate contributions for each member in this cycle
      final List<TontineContributionModel> contributions = tontine.members!.map((member) {
        return TontineContributionModel(
          id: Uuid().v4(), // Generate unique ID for each contribution
          member: MemberMapper.toModel(member) ,
          amount: tontine.contributionAmount,
          date: DateTime.now(), // Assume the contribution is made at the current date for testing
          status: false, // For testing, we assume all contributions are paid
        );
      }).toList();

      // Create the cycle with contributions
      final cycle = CycleModel(
        id: Uuid().v4(),
        number: i + 1,
        sequenceNumber: i + 1,
        tontineId: tontine.id,
        receiver: receiver,
        startDate: startDate,
        endDate: endDate,
        isCompleted: false,
        contributions: contributions,
        penalties: [], // Assuming no penalties for testing
      );

      cycles.add(cycle);
      startDate = endDate;
    }

    tontine = tontine.copyWith(cycles: cycles);
  }

  CycleEntity getCurrentCycle() {
    return tontine.cycles![currentCycleIndex] ;
  }

  String getCurrentCycleDate() {
    final cycle = getCurrentCycle();
    return '${cycle.startDate.day} ${_getMonthName(cycle.startDate.month)} ${cycle.startDate.year}';
  }

  String getCurrentReceiver() {
    return getCurrentCycle().receiver.name;
  }

  void previousCycle() {
    if (currentCycleIndex > 0) {
      currentCycleIndex--;
      update(); // Notify the UI to refresh
    }
  }

  void nextCycle() {
    if (currentCycleIndex < tontine.cycles!.length - 1) {
      currentCycleIndex++;
      update(); // Notify the UI to refresh
    }
  }

  List<MemberEntity> getMembersWithoutTontine() {
    return tontine.members!.where((member) => member.role == 'Member').toList();
  }

  List<MemberEntity> getMembersWhoReceivedTontine() {
    return tontine.cycles!
        .where((cycle) => cycle.isCompleted)
        .map((cycle) => cycle.receiver)
        .toList();
  }

  List<TontineContributionEntity> getCurrentCycleContributions() {
    return getCurrentCycle().contributions ?? [];
  }

  String _getMonthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }

  Duration _getDuration(ContributionFrequency frequency) {
    switch (frequency) {
      case ContributionFrequency.weekly:
        return Duration(days: 7);
      case ContributionFrequency.biWeekly:
        return Duration(days: 14);
      case ContributionFrequency.monthly:
        return Duration(days: 30);
      default:
        throw Exception('Invalid frequency');
    }
  }
}
