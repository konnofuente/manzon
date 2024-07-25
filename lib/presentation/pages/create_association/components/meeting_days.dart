import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class MeetingDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selectionner les 3 jours des sieges',
            style: getBoldStyle(color: AppColors.blackNormal, fontSize: 16),
          ),
          SizedBox(height: 16),
          Obx(() => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  'Lundi',
                  'Mardi',
                  'Mercredi',
                  'Jeudi',
                  'Vendredi',
                  'Samedi',
                  'Dimanche'
                ].map((day) {
                  return FilterChip(
                    label: Text(day),
                    selected: controller.meetingDays.contains(day),
                    onSelected: (selected) {
                      if (selected) {
                        controller.meetingDays.add(day);
                      } else {
                        controller.meetingDays.remove(day);
                      }
                    },
                  );
                }).toList(),
              )),
          Spacer(),
          DefaultButton(
            onTap: () {
              controller.nextStep();
            },
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
