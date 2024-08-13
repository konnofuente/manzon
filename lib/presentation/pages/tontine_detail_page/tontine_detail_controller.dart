// import 'dart:math';
// import 'package:get/get.dart';
// import 'package:uuid/uuid.dart';
// import 'package:manzon/domain/entities/member_entity.dart';
// import 'package:manzon/domain/entities/tontine_entity.dart';

// class TontineDetailController extends GetxController {
//   final String tontineId;

//   var isLoading = true.obs;
//   var tontine = Rxn<TontineEntity>();
//   var upcomingBouffe = <MemberEntity>[].obs;
//   var currentBouffe = <MemberEntity>[].obs;
//   var completedBouffe = <MemberEntity>[].obs;

//   TontineDetailController({required this.tontineId});

//   @override
//   void onInit() {
//     super.onInit();
//     fetchTontineDetails();
//   }

//   void fetchTontineDetails() async {
//     try {
//       isLoading.value = true;

//       // Generate mock data
//       tontine.value = TontineEntity(
//         uniqueId: tontineId,
//         name: 'Mock Tontine',
//         associationId: 'association_id_123',
//         members: _generateMockMembers(10),
//         balance: 1000000.0,
//         contributionFrequency: 'mois',
//         contributionAmount: 10000.0,
//         cycleDuration: 12,
//         currentCycle: 1,
//         transactions: [],
//       );

//       if (tontine.value != null) {
//         // Separate the members based on their status
//         _separateMembersByStatus(tontine.value!.members);
//       }
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   List<MemberEntity> _generateMockMembers(int count) {
//     return List.generate(count, (index) {
//       return MemberEntity(
//         id: Uuid().v4(),
//         name: 'Member $index',
//         role: 'Member',
//         userId: Uuid().v4(),
//         phoneNumber: '+237 699 442 18$index',
//       );
//     });
//   }

//   void _separateMembersByStatus(List<MemberEntity> members) {
//     final random = Random();

//     for (var member in members) {
//       final status = random.nextInt(3); // 0: upcoming, 1: current, 2: completed

//       if (status == 0) {
//         upcomingBouffe.add(member);
//       } else if (status == 1) {
//         currentBouffe.add(member);
//       } else {
//         completedBouffe.add(member);
//       }
//     }
//   }
// }
