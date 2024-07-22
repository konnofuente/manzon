import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/font_manager.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/utils/constants/export_constant_manager.dart';

class AssociationCard extends StatelessWidget {
  final String name;
  final String description;
  final String location;
  final String imageUrl;
  final double height;
  final bool isActive;

  const AssociationCard({
    Key? key,
    required this.name,
    required this.description,
    required this.location,
    required this.imageUrl,
    this.height = 170.0,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isActive ? AppColors.primaryNormal : AppColors.white,
      child: Container(
        height: height,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name,
                        style: getBoldStyle(
                            color: isActive
                                ? AppColors.white
                                : AppColors.primaryNormal,
                            fontSize: FontSize.s24)),
                    SizedBox(height: 8),
                    Text(description,
                        style: getRegularStyle(
                            color: isActive
                                ? AppColors.white
                                : AppColors.blackNormal,
                            fontSize: FontSize.s14)),
                    SizedBox(height: 8),
                    Text('Siège : $location',
                        style: getSemiBoldStyle(
                            color: isActive
                                ? AppColors.white
                                : AppColors.blackNormal,
                            fontSize: FontSize.s12)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(12)),
                child: Image.asset(imageUrl, height: height, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
