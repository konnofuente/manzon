import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';

class RadioTab extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const RadioTab({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleOnTap(
      onTap: onTap,
      child: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppPadding.p28),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryNormal : Colors.white,
            borderRadius: BorderRadius.circular(AppSize.s16),
            border: Border.all(color: isSelected ? AppColors.primaryNormal : AppColors.fontLightDisabled),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: isSelected ? Colors.white : AppColors.fontLightSecondary),
                  SizedBox(width: 8),
                  Text(
                    text,
                    style: getMediumStyle(
                      fontSize: AppSize.s16,
                      color: isSelected ? Colors.white : AppColors.fontLightSecondary,
                    ),
                  ),
                ],
              ),
              if (isSelected)
                Icon(Icons.check_circle, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
