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

  const AssociationCard({
    Key? key,
    required this.name,
    required this.description,
    required this.location,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
         
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: getBoldStyle(color: AppColors.primaryNormal, fontSize: FontSize.s18)),
                  Text(description, style: getRegularStyle(color: AppColors.grayNormal, fontSize: FontSize.s14)),
                  SizedBox(height: 8),
                  Text('Siège : $location', style: getRegularStyle(color: AppColors.grayNormal, fontSize: FontSize.s14)),
                ],
              ),
            ),
          ),
           Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              child: Image.network(imageUrl, height: 100, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
