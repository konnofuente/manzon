import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/constants/value_manager.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class Verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vérifiez vos informations et créez l\'association',
            style: getBoldStyle(color: AppColors.blackNormal, fontSize: 16),
          ),
          // Display the summary of entered data
          Container(
            // height: ScreenSize.blockSizeVertical * 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSize.s8),
            ),
            child: Image.file(
              File(controller.imagePath.value),
              fit: BoxFit.cover,
            ),
          ),
          Text('Nom: ${controller.associationNameController.text}'),
          Text(
              'Lieu: ${controller.headquaterTownController.text}, ${controller.headquaterLocationController.text}'),
          Text(
              'Fréquence de réunion: ${controller.meetingFrequency.value} fois par mois'),
          Text('Jours de réunion: ${controller.meetingDays.join(', ')}'),
          Spacer(),
          DefaultButton(
            onTap: () {
              // Call a method to save the association to the backend
              print('Creating association');
            },
            backgroundColor: AppColors.primaryNormal,
            text: 'Creer l\'association',
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          ),
        ],
      ),
    );
  }
}
