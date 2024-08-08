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
          Text(
            'Vérification des informations',
            style: getBoldStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s20),
          ),
          SizedBox(height: AppSize.s20),
          Text(
            'Nom de la tontine : ${controller.tontineNameController.text}',
            style: getRegularStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
          ),
          SizedBox(height: AppSize.s16),
          Text(
            'Montant individuel : ${controller.individualAmountController.text} FCFA',
            style: getRegularStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
          ),
          SizedBox(height: AppSize.s16),
          Text(
            'Nombre de membres : ${controller.numberOfMembersController.text}',
            style: getRegularStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
          ),
          SizedBox(height: AppSize.s16),
          Text(
            'Amande : ${controller.penaltyAmountController.text}%',
            style: getRegularStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
          ),
          SizedBox(height: AppSize.s16),
          Text(
            'Fréquence de bouffe : ${controller.contributionFrequency.value == ContributionFrequency.weekly ? 'Toutes les semaines' : 'Tous les mois'}',
            style: getRegularStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
          ),
          SizedBox(height: AppSize.s16),
          Text(
            'Fréquence de contribution : ${controller.receiverFrequency.value == ReceiverFrequency.monthly ? 'Tous les mois' : 'Tous les mois'}',
            style: getRegularStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
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
