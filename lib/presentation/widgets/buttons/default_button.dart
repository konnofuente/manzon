import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/utils/constants/export_constant_manager.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color backgroundColor;
  final String text;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final FontWeight fontWeight;
  final double borderRadius;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;

  const DefaultButton({
    Key? key,
    this.onTap,
    required this.backgroundColor,
    required this.text,
     this.textStyle ,
    required this.width,
    this.height = AppSize.buttonHeight,
    required this.fontWeight,
    required this.borderRadius,
    this.leftIcon,
    this.rightIcon,
    this.shadowColor = const Color(0x0C101828),
    this.shadowBlurRadius = 2.0,
    this.shadowSpreadRadius = 0.0,
    this.shadowOffset = const Offset(0, 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          shadows: [
            BoxShadow(
              color: shadowColor,
              blurRadius: shadowBlurRadius,
              offset: shadowOffset,
              spreadRadius: shadowSpreadRadius,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            if (leftIcon != null) SizedBox(width: 8),
            Text(
              text,
              style: textStyle ?? getSemiBoldStyle(color: AppColors.white),
            ),
            if (rightIcon != null) SizedBox(width: 8),
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
  }
}
