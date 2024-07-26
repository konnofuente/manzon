import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';

class ListTitle extends StatelessWidget {
  final String title;
  final String value;
  final Color titleColor;
  final Color valueColor;

  const ListTitle({
    Key? key,
    required this.title,
    required this.value,
    this.titleColor = AppColors.blackNormal, 
    this.valueColor = AppColors.blackNormal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: getSemiBoldStyle(color: titleColor, fontSize: FontSize.s16),
        ),
        Expanded(
          child: Text(
            value,
            style: getRegularStyle(color: valueColor, fontSize: FontSize.s16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
