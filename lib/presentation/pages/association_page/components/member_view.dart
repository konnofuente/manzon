import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/domain/entities/member_entity.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';

class MembresView extends StatelessWidget {
  final List<MemberEntity> members;

  MembresView({required this.members});

  @override
  Widget build(BuildContext context) {
    return members.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person,
                    size: 100, color: AppColors.grayNormal),
                const SizedBox(height: 16),
                Text(
                  'empty_member'.tr,
                  style: getRegularStyle(
                      color: AppColors.grayNormal, fontSize: FontSize.s16),
                ),
                const Spacer(),
                DefaultButton(
                  onTap: () {},
                  backgroundColor: AppColors.primaryNormal,
                  text: 'add_member',
                  width: double.infinity,
                  fontWeight: FontWeight.w600,
                  borderRadius: 50.0,
                ),
              ],
            ),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final member = members[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: ShapeDecoration(
                          color: AppColors.bg,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: AppColors.grayNormal,
                            child: Icon(Icons.person, color: AppColors.white),
                          ),
                          title: Text(member.name,
                              style: getBoldStyle(
                                  color: AppColors.blackNormal,
                                  fontSize: FontSize.s16)),
                          subtitle: Text(member.phoneNumber,
                              style: getRegularStyle(
                                  color: AppColors.grayNormal,
                                  fontSize: FontSize.s14)),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit_outlined,
                                        color: AppColors.blackNormal),
                                    SizedBox(width: 8),
                                    Text(
                                      'edit'.tr,
                                      style: getMediumStyle(
                                          color: AppColors.fontLightPrimary),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    Icon(Icons.exit_to_app,
                                        color: AppColors.error),
                                    SizedBox(width: 8),
                                    Text('remove_member'.tr,
                                        style: getMediumStyle(
                                            color: AppColors.error)),
                                  ],
                                ),
                              ),
                            ],
                            onSelected: (value) {
                              if (value == 'edit') {
                                // Handle edit action
                              } else if (value == 'delete') {
                                // Handle delete action
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Spacer(),
              DefaultButton(
                onTap: () {},
                backgroundColor: AppColors.primaryNormal,
                text: 'add_member'.tr,
                width: double.infinity,
                fontWeight: FontWeight.w600,
                borderRadius: 50.0,
              ),
            ],
          );
  }
}
