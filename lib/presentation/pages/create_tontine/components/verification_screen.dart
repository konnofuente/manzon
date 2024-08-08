import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
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
                Text(
                  '${controller.tontineNameController.text}/Semaine',
                  style: getBoldStyle(
                      color: AppColors.primaryNormal, fontSize: FontSize.s20),
                ),
                SizedBox(height: AppSize.s10),
                Text(
                  '${controller.selectedMembers.length} Membres',
                  style: getRegularStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize.s40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Montant individuel',
                style: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              Text(
                '${controller.individualAmountController.text} FCFA',
                style: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
            ],
          ),
          SizedBox(height: AppSize.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amande',
                style: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              Text(
                '${controller.penaltyAmountController.text}%',
                style: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
            ],
          ),
          SizedBox(height: AppSize.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fréquence de bouffe',
                style: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              Text(
                controller.receiverFrequency.value == ReceiverFrequency.monthly
                    ? 'Tous les mois'
                    : controller.receiverFrequency.value ==
                            ReceiverFrequency.biMonthly
                        ? 'Tous les deux mois'
                        : 'Tous les trimestres',
                style: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
            ],
          ),
          SizedBox(height: AppSize.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fréquence de contribution',
                style: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              Text(
                controller.contributionFrequency.value ==
                        ContributionFrequency.weekly
                    ? 'Toutes les semaines'
                    : controller.contributionFrequency.value ==
                            ContributionFrequency.biWeekly
                        ? 'Toutes les deux semaines'
                        : 'Tous les mois',
                style: getRegularStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
            ],
          ),
          Spacer(),
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
