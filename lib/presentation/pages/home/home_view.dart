import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../widgets/cards/association_card.dart';
import '../../../app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/pages/home/home_controller.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/pages/home/components/profile_info.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController(
    getUserByIdUseCase: Get.find(),
  ));

  @override
  void initState() {
    super.initState();
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
 
    final double verticalPadding = 16.0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackNormal),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final user = controller.user.value;
              return user != null
                  ? ProfileInfo(
                      name: user.name ?? "No Name",
                      phoneNumber: user.phoneNumber,
                      onEdit: () => print('Edit Profile'),
                    )
                  : CircularProgressIndicator();
            }),
            SizedBox(height: verticalPadding),
            Text(
              "my_association".tr,
              style: getBoldStyle(
                  color: AppColors.blackDark, fontSize: FontSize.s24),
            ),
            SizedBox(height: verticalPadding),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.associations.length,
                  itemBuilder: (context, index) {
                    final association = controller.associations[index];
                    return AssociationCard(
                      name: association['name']!,
                      description: association['description']!,
                      location: association['location']!,
                      imageUrl: association['imageUrl']!,
                      isActive: index % 2 == 0 ? false : true,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: DefaultButton(
        onTap: () => print('Create New Association'),
        backgroundColor: AppColors.primaryNormal,
        text: 'new_association'.tr,
        width: ScreenSize.screenWidth * 0.9,
        fontWeight: FontWeight.w600,
        borderRadius: AppRadius.r50,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
