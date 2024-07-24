import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';


class ProfileInfo extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final VoidCallback onEdit;

  const ProfileInfo({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.onEdit,
  });

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                ImageAssets.profile,
                width: 70,
                height: 70,
              ),
              const SizedBox(width: AppSize.s8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,
                      style: getRegularStyle(
                          color: AppColors.blackNormal,
                          fontSize: FontSize.s14)),
                  Text(widget.phoneNumber,
                      style: getBoldStyle(
                          color: AppColors.blackDark, fontSize: FontSize.s16)),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.mode_edit_outlined, color: AppColors.blackDark),
            onPressed: widget.onEdit,
          ),
        ],
      ),
    );
  }
}
