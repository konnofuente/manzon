import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';

class FollowUpSection extends StatefulWidget {
  @override
  _FollowUpSectionState createState() => _FollowUpSectionState();
}

class _FollowUpSectionState extends State<FollowUpSection> {
  final TontineController controller = Get.put(TontineController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('Deja bouffe', controller.getMembersWhoReceivedTontine(), isActive: false),
                _buildFilterChip('Pas encore bouffe', controller.getMembersWithoutTontine(), isActive: false),
                _buildFilterChip('En cours de bouffe', [controller.getCurrentCycle().receiver], isActive: false),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildFollowUpCategory(
                'Ceux qui n’ont pas encore bouffe',
                controller.getMembersWithoutTontine(),
                status: 'A venir',
                backgroundColor: AppColors.primaryLight,
              ),
              _buildFollowUpCategory(
                'La personne qui bouffe',
                [controller.getCurrentCycle().receiver],
                status: 'En cours',
                backgroundColor: AppColors.primaryLight,
              ),
              _buildFollowUpCategory(
                'Ceux qui ont deja bouffe',
                controller.getMembersWhoReceivedTontine(),
                status: 'Bouffe',
                backgroundColor: AppColors.grayLight,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, List<MemberEntity> members, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(label),
        selected: isActive,
        onSelected: (bool selected) {
          // Handle filter change
        },
        selectedColor: AppColors.primaryNormal,
        backgroundColor: AppColors.grayLight,
        labelStyle: TextStyle(
          color: isActive ? Colors.white : AppColors.fontLightPrimary,
        ),
      ),
    );
  }

  Widget _buildFollowUpCategory(String title, List<MemberEntity> members, {required String status, Color? backgroundColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            title,
            style: getSemiBoldStyle(color: AppColors.blackNormal),
          ),
        ),
        ...members.map((member) {
          return Container(
            color: backgroundColor ?? Colors.transparent,
            child: ListTile(
              title: Text(
                member.name,
                style: getMediumStyle(color: AppColors.blackNormal),
              ),
              subtitle: Text(member.phoneNumber),
              trailing: Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  status,
                  style: getMediumStyle(color: AppColors.primaryNormal),
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
