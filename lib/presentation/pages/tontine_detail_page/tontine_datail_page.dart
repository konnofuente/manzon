// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:manzon/domain/entities/tontine_entity.dart';
// import 'package:manzon/presentation/widgets/export_widget.dart';
// import 'package:manzon/app/config/theme/export_theme_manager.dart';
// import 'package:manzon/presentation/controllers/tontine_detail_controller.dart';

// class TontineDetailPage extends StatelessWidget {
//   final String tontineId;

//   TontineDetailPage({required this.tontineId});

//   @override
//   Widget build(BuildContext context) {
//     final TontineDetailController controller = Get.put(TontineDetailController(tontineId: tontineId));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tontine Details'),
//         backgroundColor: AppColors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: AppColors.blackNormal),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (controller.tontine == null) {
//           return Center(child: Text('Tontine not found'));
//         } else {
//           final tontine = controller.tontine!;
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${tontine.contributionAmount}Fcfa/${tontine.contributionFrequency}',
//                   style: getBoldStyle(color: AppColors.primaryNormal, fontSize: FontSize.s24),
//                 ),
//                 Text(
//                   'Bouffe : ${tontine.balance}Fcfa',
//                   style: getRegularStyle(color: AppColors.secondaryNormalActive, fontSize: FontSize.s14),
//                 ),
//                 SizedBox(height: 16),
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       SectionHeader(title: 'Suivi des bouffes'),
//                       BouffeSection(controller: controller),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }

// class SectionHeader extends StatelessWidget {
//   final String title;

//   SectionHeader({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Text(
//         title,
//         style: getBoldStyle(color: AppColors.blackNormal, fontSize: FontSize.s16),
//       ),
//     );
//   }
// }

// class BouffeSection extends StatelessWidget {
//   final TontineDetailController controller;

//   BouffeSection({required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         BouffeStatus(
//           title: 'Ceux qui n\'ont pas encore bouffe',
//           members: controller.upcomingBouffe,
//           status: 'A Venir',
//         ),
//         BouffeStatus(
//           title: 'La personne qui bouffe',
//           members: controller.currentBouffe,
//           status: 'En Cours',
//         ),
//         BouffeStatus(
//           title: 'Ceux qui ont deja bouffe',
//           members: controller.completedBouffe,
//           status: 'Bouffe',
//           isCompleted: true,
//         ),
//       ],
//     );
//   }
// }

// class BouffeStatus extends StatelessWidget {
//   final String title;
//   final List<MemberEntity> members;
//   final String status;
//   final bool isCompleted;

//   BouffeStatus({required this.title, required this.members, required this.status, this.isCompleted = false});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: getBoldStyle(color: AppColors.blackNormal, fontSize: FontSize.s14),
//           ),
//           ...members.map((member) => BouffeListItem(member: member, status: status, isCompleted: isCompleted)).toList(),
//         ],
//       ),
//     );
//   }
// }

// class BouffeListItem extends StatelessWidget {
//   final MemberEntity member;
//   final String status;
//   final bool isCompleted;

//   BouffeListItem({required this.member, required this.status, this.isCompleted = false});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Container(
//         padding: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: isCompleted ? AppColors.grayLight : AppColors.bg,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(member.name, style: getBoldStyle(color: AppColors.blackNormal, fontSize: FontSize.s16)),
//                 Text(
//                   '12/07/06',
//                   style: getRegularStyle(color: AppColors.grayNormal, fontSize: FontSize.s14),
//                 ),
//               ],
//             ),
//             Text(
//               status,
//               style: getRegularStyle(
//                 color: isCompleted ? AppColors.grayNormal : AppColors.primaryNormal,
//                 fontSize: FontSize.s14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
