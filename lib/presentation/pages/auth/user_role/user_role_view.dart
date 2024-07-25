import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/app/core/utils/enums/export_enums.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/widgets/radio_input/radio_tap.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';
import 'package:manzon/presentation/pages/auth/user_role/user_role_controller.dart';

class UserRoleView extends StatefulWidget {
  @override
  State<UserRoleView> createState() => _UserRoleViewState();
}

class _UserRoleViewState extends State<UserRoleView> {
  @override
  Widget build(BuildContext context) {
    final UserRoleController controller = Get.put(UserRoleController());
    final double verticalPadding = ScreenSize.screenHeight * 0.02;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: verticalPadding * 3),
            Center(
              child: Text(
                "you_are?".tr,
                style: getBlackStyle(
                  color: AppColors.blackNormal,
                  fontSize: FontSize.s24,
                ),
              ),
            ),
            SizedBox(height: verticalPadding * 4),
            Obx(() => RadioTab(
              text: "member_role".tr,
              icon: Icons.person,
              isSelected: controller.selectedRole.value == "member",
              onTap: () => controller.selectRole("member"),
            )),
            SizedBox(height: verticalPadding*2),
            Obx(() => RadioTab(
              text: "admin_role".tr,
              icon: Icons.admin_panel_settings,
              isSelected: controller.selectedRole.value == "admin",
              onTap: () => controller.selectRole("admin"),
            )),
            Spacer(),
            Obx(() => DefaultButton(
              onTap: controller.selectedRole.value.isNotEmpty
                  ? () =>  Get.toNamed(AppRouteNames.register)
                  : null,
              backgroundColor: AppColors.primaryNormal,
              status: controller.selectedRole.value.isNotEmpty
                  ? ButtonState.enable
                  : ButtonState.disable,
              text: 'next'.tr,
              width: double.infinity,
              fontWeight: FontWeight.w600,
              borderRadius: AppRadius.r50,
            )),
            SizedBox(height: verticalPadding * 2),
          ],
        ),
      ),
    );
  }
}
