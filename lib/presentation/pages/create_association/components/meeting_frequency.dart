import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class MeetingFrequency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selectionner le nombre de rencontres que vous tenez par mois',
            style: getBoldStyle(color: AppColors.blackNormal, fontSize: 16),
          ),
          SizedBox(height: 16),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return ChoiceChip(
                    label: Text('${index + 1}'),
                    selected: controller.meetingFrequency.value == index + 1,
                    onSelected: (selected) {
                      controller.meetingFrequency.value = index + 1;
                    },
                  );
                }),
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
