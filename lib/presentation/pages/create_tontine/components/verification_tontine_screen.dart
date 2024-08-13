import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/enums/button_status.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/widgets/tiles/verification_tiles.dart';
import 'package:manzon/presentation/controllers/create_tontine_controller.dart';

class VerificationScreen extends StatelessWidget {
  final CreateTontineController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                VerificationTile(
                  title:
                      '${controller.individualAmountController.text}/${controller.contributionFrequency.value.toShortString()}',
                  subtitle: '${controller.selectedMembers.length} Membres',
                  titleStyle: getBoldStyle(
                      color: AppColors.primaryNormal, fontSize: FontSize.s20),
                  subtitleStyle: getRegularStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                VerificationTile(
                  title: 'individual_amount'.tr,
                  subtitle:
                      '${controller.individualAmountController.text} FCFA',
                  titleStyle: getRegularStyle(
                    color: AppColors.fontLightDisabled,
                    fontSize: FontSize.s16,
                  ),
                  subtitleStyle: getRegularStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s14),
                ),
                SizedBox(height: AppSize.s20),
                VerificationTile(
                  title: 'fine'.tr,
                  subtitle: '${controller.penaltyAmountController.text} FCFA',
                  titleStyle: getRegularStyle(
                    color: AppColors.fontLightDisabled,
                    fontSize: FontSize.s16,
                  ),
                  subtitleStyle: getRegularStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s14),
                ),
                SizedBox(height: AppSize.s20),
                VerificationTile(
                  title: 'collection_frequency'.tr,
                  subtitle:
                      'Tous les ${controller.receiverFrequency.value.toShortString()}',
                  titleStyle: getRegularStyle(
                    color: AppColors.fontLightDisabled,
                    fontSize: FontSize.s16,
                  ),
                  subtitleStyle: getRegularStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s14),
                ),
                SizedBox(height: AppSize.s20),
                VerificationTile(
                  title: 'contribution_frequency'.tr,
                  subtitle:
                      'Tous les ${controller.contributionFrequency.value.toShortString()}',
                  titleStyle: getRegularStyle(
                    color: AppColors.fontLightDisabled,
                    fontSize: FontSize.s16,
                  ),
                  subtitleStyle: getRegularStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s14),
                ),
                SizedBox(height: AppSize.s20),
              ],
            ),
          ),
          Obx(() => DefaultButton(
            onTap: controller.createTontine,
            status: controller.isCreatingTontine.value ? ButtonState.loading : ButtonState.enable, // Update ButtonState as needed
            backgroundColor: AppColors.primaryNormal,
            text: 'create_tontine'.tr,
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          )),
          
        ],
      ),
    );
  }
}
