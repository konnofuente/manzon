import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/controllers/create_tontine_controller.dart';
import 'package:manzon/presentation/pages/create_tontine/widgets/step_information.dart';

class FinancialInformation extends StatelessWidget {
  final CreateTontineController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepInformation(
          title: 'Informations financieres',
          description: 'Entrer les informations financieres de la tontine',
        ),
        Text('Montant individuel',
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        const SizedBox(
          height: AppPadding.p8,
        ),
        TextFieldWidget(
          prefixIcon: Icons.money,
          hintText: "10000 Fcfa".tr,
          controller: controller.individualAmountController,
          isPassword: false,
          keyboardType: TextInputType.number,
          readOnly: false,
        ),
        Text('Type d\'amande',
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.symmetric(vertical: AppPadding.p16),
            child: Obx(
              () => Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                          value: PenaltyType.fixAmount,
                          groupValue: controller.penaltyType.value,
                          onChanged: (value) {
                            controller.updatePenaltyType(value!);
                          },
                        ),
                        Text('Montant fixe'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                          value: PenaltyType.percentage,
                          groupValue: controller.penaltyType.value,
                          onChanged: (value) {
                            controller.updatePenaltyType(value!);
                          },
                        ),
                        Text('Pourcentage'),
                      ],
                    ),
                  ),
                ],
              ),
            )),
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
        Text('Entrer le montant',
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
