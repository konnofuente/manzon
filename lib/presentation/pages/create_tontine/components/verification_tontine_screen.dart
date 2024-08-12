import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
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
                  title: 'Montant individuel',
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
                  title: 'Amande',
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
                  title: 'Fréquence de bouffe',
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
                  title: 'Fréquence de contribution',
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
          DefaultButton(
            onTap: controller.createTontine,
            backgroundColor: AppColors.primaryNormal,
            text: 'Créer la tontine',
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          ),
        ],
      ),
    );
  }
}
