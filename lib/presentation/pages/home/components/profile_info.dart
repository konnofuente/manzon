import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/font_manager.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/utils/constants/export_constant_manager.dart';

class ProfileInfo extends StatefulWidget {
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
              SizedBox(width: AppSize.s8),
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
            icon: Icon(Icons.mode_edit_outlined, color: AppColors.blackDark),
            onPressed: widget.onEdit,
          ),
        ],
      ),
    );
  }
}
