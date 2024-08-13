import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/controllers/create_tontine_controller.dart';
import 'package:manzon/presentation/pages/create_tontine/widgets/step_information.dart';

class TontineInformation extends StatefulWidget {
  @override
  State<TontineInformation> createState() => _TontineInformationState();
}

class _TontineInformationState extends State<TontineInformation> {
  final CreateTontineController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         StepInformation(
          title: 'basic_information'.tr,
          description: 'enter_the_basic_information_of_the_tontine'.tr,
        ),
        SizedBox(
          height: AppSize.s12,
        ),
        Text('what_is_the_tontine_name'.tr,
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        const SizedBox(
          height: AppPadding.p8,
        ),
        TextFieldWidget(
          prefixIcon: Icons.location_city,
          hintText: "name".tr,
          controller: controller.tontineNameController,
          isPassword: false,
          keyboardType: TextInputType.text,
          readOnly: false,
        ),
        Text('number_of_member'.tr,
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        const SizedBox(
          height: AppPadding.p8,
        ),
        TextFieldWidget(
          prefixIcon: Icons.numbers,
          hintText: "10".tr,
          controller: controller.numberOfMembersController,
          isPassword: false,
          keyboardType: TextInputType.number,
          readOnly: false,
        ),
        Text('contribution_frequency'.tr,
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        Obx(() {
          return Column(
            children: [
              Row(
                children: [
                  Radio<ContributionFrequency>(
                    value: ContributionFrequency.weekly,
                    groupValue: controller.contributionFrequency.value,
                    onChanged: (value) {
                      controller.updateContributionFrequency(value!);
                    },
                  ),
                   Text('every_week'.tr),
                ],
              ),
              Row(
                children: [
                  Radio<ContributionFrequency>(
                    value: ContributionFrequency.biWeekly,
                    groupValue: controller.contributionFrequency.value,
                    onChanged: (value) {
                      controller.updateContributionFrequency(value!);
                    },
                  ),
                   Text('every_2_weeks'.tr),
                ],
              ),
            ],
          );
        }),
        SizedBox(height: AppSize.s16),
        Text('collection_frequency'.tr,
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16)),
        Obx(() {
          return Column(
            children: [
              Row(
                children: [
                  Radio<ReceiverFrequency>(
                    value: ReceiverFrequency.monthly,
                    groupValue: controller.receiverFrequency.value,
                    onChanged: (value) {
                      controller.updateReceiverFrequency(value!);
                    },
                  ),
                  Text('every_month'.tr),
                ],
              ),
              Row(
                children: [
                  Radio<ReceiverFrequency>(
                    value: ReceiverFrequency.biMonthly,
                    groupValue: controller.receiverFrequency.value,
                    onChanged: (value) {
                      controller.updateReceiverFrequency(value!);
                    },
                  ),
                  Text('every_2_months'.tr),
                ],
              ),
            ],
          );
        }),
        const Spacer(),
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
