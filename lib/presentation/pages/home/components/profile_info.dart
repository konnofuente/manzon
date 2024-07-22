import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/font_manager.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/utils/constants/export_constant_manager.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final VoidCallback onEdit;

  const ProfileInfo({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.onEdit,
  }) : super(key: key);

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
              // SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: getRegularStyle(
                          color: AppColors.blackNormal,
                          fontSize: FontSize.s18)),
                  Text(phoneNumber,
                      style: getBoldStyle(
                          color: AppColors.grayNormal, fontSize: FontSize.s14)),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.edit, color: AppColors.grayNormal),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}
