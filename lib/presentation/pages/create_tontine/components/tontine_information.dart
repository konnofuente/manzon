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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepInformation(
            title: 'Creating Tontine',
            description: 'Enter the rank of food for each member',
          ),
          SizedBox(
            height: AppSize.s12,
          ),
          Text('Quel est le nom de la tontine?',
              style: getMediumStyle(
                  color: AppColors.blackNormal, fontSize: FontSize.s16)),
          const SizedBox(
            height: AppPadding.p8,
          ),
          TextFieldWidget(
            prefixIcon: Icons.location_city,
            hintText: "Nom de la tontine".tr,
            controller: controller.tontineNameController,
            isPassword: false,
            keyboardType: TextInputType.text,
            readOnly: false,
          ),
          Text('Nombre de membre',
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
          const Spacer(),
          DefaultButton(
            onTap: controller.nextStep,
            backgroundColor: AppColors.primaryNormal,
            text: 'Continuer',
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          ),
        ],
      ),
    );
  }
}
