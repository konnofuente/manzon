import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import '../../../../app/config/theme/export_theme_manager.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';

class AssociationHeader extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String createdDate;

  const AssociationHeader({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.createdDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.blackNormal),
                onPressed: () => Get.back(),
              ),
              ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: ImageAssets.peigne1, // Add your placeholder image here
                  image: imageUrl, // Dynamic URL passed as a prop
                  width: AppSize.s60,
                  height: AppSize.s60,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      ImageAssets.peigne1,
                      width: AppSize.s60,
                      height: AppSize.s60,
                      fit: BoxFit.fitWidth,
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name, // Dynamic name passed as a prop
                      style: getSemiBoldStyle(
                        color: AppColors.primaryNormal,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    // SizedBox(height: 4),
                    Text(
                      'Creé Le $createdDate', // Dynamic createdDate passed as a prop
                      style: getMediumStyle(
                        color: AppColors.grayNormal,
                        fontSize: FontSize.s12,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: AppColors.blackNormal),
                onSelected: (String result) {
                  // Handle option selection
                  print(result);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Details de l’’association',
                    child: Text('Details de l’’association'),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
