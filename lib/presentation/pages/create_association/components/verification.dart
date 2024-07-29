import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/list_title.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/app/core/utils/constants/value_manager.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class Verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'verify_information'.tr,
              style: getBoldStyle(
                  color: AppColors.blackNormal, fontSize: FontSize.s20),
            ),
          ),
          SizedBox(
            height: AppSize.s24,
          ),
          // Display the summary of entered data
          Container(
            // height: ScreenSize.blockSizeVertical * 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSize.s8),
            ),
            child: controller.imagePath.value.isEmpty
                ? SizedBox.shrink()
                : Image.file(
                    File(controller.imagePath!.value),
                    fit: BoxFit.cover,
                  ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTitle(
                  title: 'name'.tr,
                  value: controller.associationNameController.text),
              ListTitle(
                  title: 'location'.tr,
                  value:
                      '${controller.headquaterTownController.text}, ${controller.headquaterLocationController.text}'),
              ListTitle(
                  title: 'meeting_frequency'.tr,
                  value: '${controller.meetingFrequency.value} fois par mois'),
              ListTitle(
                  title: 'meeting_days'.tr,
                  value: controller.meetingDays.join(', ')),
            ],
          ),

          Spacer(),
          DefaultButton(
            onTap: () {
              print('Creating association');
              controller.createAssociation();
            },
            backgroundColor: AppColors.primaryNormal,
            text: 'create_association'.tr,
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          ),
        ],
      ),
    );
  }
}
