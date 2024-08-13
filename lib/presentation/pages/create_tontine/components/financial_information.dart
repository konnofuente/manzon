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
         StepInformation(
          title: 'financial_information'.tr,
          description: 'enter_tontine_financial_information'.tr,
        ),
        Text('individual_amount'.tr,
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
        Text('fine_type'.tr,
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
                        Text('fixed_amount'.tr),
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
                        Text('percentage'.tr),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Obx(() {
          if (controller.penaltyType.value == PenaltyType.percentage) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'enter_percentage'.tr,
                  style: getMediumStyle(
                    color: AppColors.blackNormal,
                    fontSize: FontSize.s16,
                  ),
                ),
                SizedBox(height: AppSize.s8),
                TextFieldWidget(
                  prefixIcon: Icons.percent,
                  hintText: "enter_percentage".tr,
                  controller: controller.penaltyAmountController,
                  isPassword: false,
                  keyboardType: TextInputType.number,
                  readOnly: false,
                ),
              ],
            );
          } else if (controller.penaltyType.value == PenaltyType.fixAmount) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'enter_amount'.tr,
                  style: getMediumStyle(
                    color: AppColors.blackNormal,
                    fontSize: FontSize.s16,
                  ),
                ),
                SizedBox(height: AppSize.s8),
                TextFieldWidget(
                  prefixIcon: Icons.attach_money,
                  hintText: "enter_amount".tr,
                  controller: controller.penaltyAmountController,
                  isPassword: false,
                  keyboardType: TextInputType.number,
                  readOnly: false,
                ),
              ],
            );
          } else {
            // Return null or handle another case if needed
            return SizedBox.shrink();
          }
        }),
        Spacer(),
        DefaultButton(
          onTap: controller.nextStep,
          backgroundColor: AppColors.primaryNormal,
          text: 'continue'.tr,
          width: double.infinity,
          fontWeight: FontWeight.w600,
          borderRadius: 50.0,
        ),
      ],
    );
  }
}
