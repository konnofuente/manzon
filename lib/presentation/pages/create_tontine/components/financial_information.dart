import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/controllers/create_tontine_controller.dart';

class FinancialInformation extends StatelessWidget {
  final CreateTontineController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type d\'amande',
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        Container(
          width: double.infinity,
          padding: EdgeInsetsDirectional.symmetric(vertical: AppPadding.p18),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: 'Pourcentage',
                      groupValue: controller.penaltyType.value,
                      onChanged: (value) {
                        controller.updatePenaltyType(value as String);
                      },
                    ),
                    Text('Pourcentage'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: 'Montant fixe',
                      groupValue: controller.penaltyType.value,
                      onChanged: (value) {
                        controller.updatePenaltyType(value as String);
                      },
                    ),
                    Text('Montant fixe'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text('Entrer le pourcentage',
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        SizedBox(height: AppSize.s8),

        TextFieldWidget(
          prefixIcon: Icons.percent,
          hintText: "Entrer le pourcentage".tr,
          controller: controller.penaltyAmountController,
          isPassword: false,
          keyboardType: TextInputType.number,
          readOnly: false,
        ),
        // SizedBox(height: AppSize.s14),
        Text('Frequence de bouffe',
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        Column(
          children: [
            Row(
              children: [
                Radio(
                  value: ContributionFrequency.weekly,
                  groupValue: controller.contributionFrequency.value,
                  onChanged: (value) {
                    controller.updateContributionFrequency(
                        value as ContributionFrequency);
                  },
                ),
                Text('Toutes les semaines'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: ContributionFrequency.monthly,
                  groupValue: controller.contributionFrequency.value,
                  onChanged: (value) {
                    controller.updateContributionFrequency(
                        value as ContributionFrequency);
                  },
                ),
                Text('Tous les mois'),
              ],
            ),
          ],
        ),
        SizedBox(height: AppSize.s16),
        Text('Frequence de contribution',
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        Column(
          children: [
            Row(
              children: [
                Radio(
                  value: ReceiverFrequency.monthly,
                  groupValue: controller.receiverFrequency.value,
                  onChanged: (value) {
                    controller
                        .updateReceiverFrequency(value as ReceiverFrequency);
                  },
                ),
                Text('Toutes les semaines'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: ReceiverFrequency.monthly,
                  groupValue: controller.receiverFrequency.value,
                  onChanged: (value) {
                    controller
                        .updateReceiverFrequency(value as ReceiverFrequency);
                  },
                ),
                Text('Tous les mois'),
              ],
            ),
          ],
        ),
        Spacer(),
        DefaultButton(
          onTap: controller.nextStep,
          backgroundColor: AppColors.primaryNormal,
          text: 'Continuer',
          width: double.infinity,
          fontWeight: FontWeight.w600,
          borderRadius: 50.0,
        ),
      ],
    );
  }
}
