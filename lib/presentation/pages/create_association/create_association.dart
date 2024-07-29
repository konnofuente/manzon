import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'export_create_association.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class CreateAssociation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller =
        Get.put(CreateAssociationController(Get.find(), Get.find()));

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ScreenSize.horizontalPadding),
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFFBFBFD)),
          child: Column(
            children: [
              CustomNavigationBar(controller: controller),
              Text(
                'creating_association'.tr,
                style: getBlackStyle(
                    fontSize: FontSize.s24, color: AppColors.blackNormal),
              ),
              SizedBox(
                height: AppSize.s40,
              ),
              Expanded(
                  child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BasicInformation(),
                  Headquarters(),
                  MeetingFrequency(),
                  MeetingDays(),
                  Verification(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
