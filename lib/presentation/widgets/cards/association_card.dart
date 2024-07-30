import 'dart:math';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';

class AssociationCard extends StatelessWidget {
  final String name;
  final String? description;
  final String? location;
  final String? imageUrl;
  final double height;
  final bool isActive;

  const AssociationCard({
    Key? key,
    required this.name,
    this.description,
    this.location,
    this.imageUrl,
    this.height = 170.0,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    
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
                    if (location != null || description != null) ...[
                      SizedBox(height: 8),
                      Text(
                        description ?? '$name situated at $location',
                        style: getRegularStyle(
                            color: isActive
                                ? AppColors.white
                                : AppColors.blackNormal,
                            fontSize: FontSize.s14),
                      ),
                    ],
                    if (location != null) ...[
                      SizedBox(height: 8),
                      Text('Siège : $location',
                          style: getSemiBoldStyle(
                              color: isActive
                                  ? AppColors.white
                                  : AppColors.blackNormal,
                              fontSize: FontSize.s12)),
                    ],
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: imageUrl != null
                  ? ClipRRect(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(12)),
                      child: Image.network(imageUrl!,
                          height: height, fit: BoxFit.cover),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: randomColor,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(12)),
                      ),
                      child: Center(
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                              color: AppColors.white, fontSize: FontSize.s24),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
