import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app/core/utils/enums/export_enums.dart';
import 'package:manzon/app/config/theme/app_colors.dart';


class RoundedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color backgroundColor;
  final ButtonState status;
  final String? name;
  final double? width;
  final double? height;
  final Color contentColor;
  final double? loaderSize;
  final double? borderSize;
  final Color? borderColor;
  final bool hasElevation;
  final Icon? icon;
  final String? svgAsset;

  const RoundedButton({
    super.key,
    this.onTap,
    required this.backgroundColor,
    required this.status,
    this.name,
    this.width,
     this.height,
    required this.contentColor,
     this.loaderSize,
     this.borderSize,
    this.borderColor,
    required this.hasElevation,
    this.icon,
    this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: status == ButtonState.enable ? onTap : null,
      child: Center(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: status == ButtonState.disable ? Colors.grey : backgroundColor,
            border: Border.all(
              width: borderSize ?? 0.0,
              color: borderColor ?? AppColors.primaryNormal,
            ),
            borderRadius: BorderRadius.circular(100),
            boxShadow: hasElevation
                ? [const BoxShadow(color: Colors.black26, blurRadius: 4, spreadRadius: 1)]
                : [],
          ),
          child: status == ButtonState.loading
              ? SizedBox(
                  width: loaderSize,
                  height: loaderSize,
                  child: CircularProgressIndicator(
                    color: contentColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      icon!
                    else if (svgAsset != null)
                      SvgPicture.asset(
                        svgAsset!,
                        color: contentColor,
                      ),
                    if (name != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          name!,
                          style: TextStyle(
                            color: contentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
