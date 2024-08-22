import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../app/config/theme/export_theme_manager.dart';

class CustomHeader extends StatelessWidget {
  final String name;
  final String? imageUrl; // Make imageUrl optional using String?
  final String createdDate;
  final List<PopupMenuItem<String>> menuItems; // Accept a list of PopupMenuItems

  // Add a constructor parameter to pass the function callback for each menu item
  final void Function(String) onMenuSelected;

  const CustomHeader({
    Key? key,
    required this.name,
    this.imageUrl, // Image URL is now not required
    required this.createdDate,
    required this.menuItems, // Menu items are passed as required
    required this.onMenuSelected, // Callback function for menu items
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
              if (imageUrl != null) // Check if imageUrl is provided
                ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: ImageAssets.peigne1,
                    image: imageUrl!,
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
                      name,
                      style: getSemiBoldStyle(
                        color: AppColors.primaryNormal,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    Text(
                      '${'created_on'.tr} $createdDate',
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
                onSelected: onMenuSelected, // Use the provided callback function
                itemBuilder: (BuildContext context) => menuItems, // Use the provided list of menu items
              )
            ],
          ),
        ],
      ),
    );
  }
}
