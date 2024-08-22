import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/infrastructure/data_sources/firebase/tontine_data_source.dart';
import 'package:manzon/infrastructure/data_sources/firebase/tontine_data_source.dart';


class TontineController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  String associationId = '';
  final TontineDataSource tontineDataSource = TontineDataSource();

  // Dummy data for fake tontine members
  final List<Member> members = [
    Member(name: 'Elisabeth Singou', phone: '+237 699 442 188', status: 'Pas encore bouffe'),
    Member(name: 'John Doe', phone: '+237 688 123 456', status: 'Bouffe'),
    Member(name: 'Jane Smith', phone: '+237 677 654 321', status: 'Deja bouffe'),
    // Add more dummy members here
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    final StateController stateController = Get.find();
    associationId = stateController.selectedAssociationId.value;
  }

  List<Member> getMembersWithoutTontine() {
    return members.where((member) => member.status == 'Pas encore bouffe').toList();
  }

  List<Member> getCurrentTontineReceiver() {
    return members.where((member) => member.status == 'Bouffe').toList();
  }

  List<Member> getMembersWhoReceivedTontine() {
    return members.where((member) => member.status == 'Deja bouffe').toList();
  }

  void previousCycle() {
    // Handle previous cycle logic here
  }

  void nextCycle() {
    // Handle next cycle logic here
  }

  String getCurrentCycleDate() {
    // Return the formatted cycle date
    return '15 August 2023'; // Replace with actual cycle date
  }

  String getCurrentReceiver() {
    // Return the name of the current receiver
    return 'Elisabeth Singou'; // Replace with actual receiver's name
  }

  List<Member> getMemberList() {
    return members; // Replace with the logic to fetch actual members
  }
}

class Member {
  final String name;
  final String phone;
  final String status; // Whether the person has received or not

  Member({required this.name, required this.phone, required this.status});
}
