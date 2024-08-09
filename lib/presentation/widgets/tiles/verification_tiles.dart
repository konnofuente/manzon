import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';

class VerificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;

  const VerificationTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.titleStyle = const TextStyle(color: AppColors.fontLightSecondary, fontSize: FontSize.s16), // Use constant values
    this.subtitleStyle = const TextStyle(color: AppColors.fontLightSecondary, fontSize: FontSize.s12), // Use constant values
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(height: 12.0),
          Text(
            subtitle,
            style: subtitleStyle,
          ),
           const Divider(
            color: AppColors.fontLightSecondary,
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}
