import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';

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

  Color getRandomColor(String input) {
    final hashCode = input.hashCode;
    final r = (hashCode & 0xFF0000) >> 16;
    final g = (hashCode & 0x00FF00) >> 8;
    final b = hashCode & 0x0000FF;
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    final randomColor = getRandomColor(name);
    
    return GestureDetector(
      onTap: () => Get.toNamed(AppRouteNames.associationPage),
      child: Card(
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
                        child: FadeInImage.assetNetwork(
                          placeholder: GifAssets.loadingGif, // Set your placeholder asset here
                          image: imageUrl!,
                          height: height,
                          fit: BoxFit.cover,
                        )
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
      ),
    );
  }
}
