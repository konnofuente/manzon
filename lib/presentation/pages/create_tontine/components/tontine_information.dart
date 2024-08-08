import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/create_tontine_controller.dart';

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
        const SizedBox(height: AppSize.s16),
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
        const SizedBox(height: AppSize.s16),
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
    );
  }
}
