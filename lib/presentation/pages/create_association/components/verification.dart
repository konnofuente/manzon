import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/presentation/widgets/list_title.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/widgets/tiles/verification_tiles.dart';
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
          Expanded(
            child: Container(
              height: ScreenSize.blockSizeVertical * 15,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(
                    50.0), 
              ),
              child: controller.imagePath.value.isEmpty
                  ? SizedBox.shrink()
                  : Image.file(
                      File(controller.imagePath!.value),
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          SizedBox(
            height: AppSize.s24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerificationTile(
                title: controller.associationNameController.text,
                subtitle: '0 Members',
                titleStyle: getBoldStyle(
                    color: AppColors.primaryNormal, fontSize: FontSize.s20),
                subtitleStyle: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              VerificationTile(
                title: 'created_on'.tr,
                subtitle:
                    '${controller.headquaterTownController.text}, ${controller.headquaterLocationController.text}',
                titleStyle: getRegularStyle(
                    color: AppColors.fontDarkSecondary, fontSize: FontSize.s16),
                subtitleStyle: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              VerificationTile(
                title: 'meeting_frequency'.tr,
                subtitle: '${controller.meetingFrequency.value} fois par mois',
                titleStyle: getRegularStyle(
                    color: AppColors.fontDarkSecondary, fontSize: FontSize.s16),
                subtitleStyle: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              VerificationTile(
                title: 'office_days'.tr,
                subtitle: controller.meetingDays.join(', '),
                titleStyle: getRegularStyle(
                    color: AppColors.fontDarkSecondary, fontSize: FontSize.s16),
                subtitleStyle: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
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
