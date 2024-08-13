import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';

class StepInformation extends StatelessWidget {
  final String title;
  final String description;

  const StepInformation({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: getBlackStyle(
                fontSize: FontSize.s24, color: AppColors.blackNormal),
          ),
          SizedBox(
            height: AppSize.s16,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: getRegularStyle(color: AppColors.fontLightSecondary),
          ),
          SizedBox(
            height: AppSize.s12,
          ),
        ],
      ),
    );
  }
}
