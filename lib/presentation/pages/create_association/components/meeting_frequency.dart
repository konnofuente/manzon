import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import '../../../../app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class MeetingFrequency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selectionner le nombre de rencontres que vous tenez par mois',
            // style: TextStyle(fontSize: FontSize.s16,color: AppColors.blackNormal,),
            style: getCustomStyle(
              color: AppColors.blackNormal,
              fontSize: FontSize.s16,
            ),
          ),
          SizedBox(height: AppSize.s16),
          Obx(() => Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: List.generate(6, (index) {
                    return ChoiceChip(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      label: Text('${index + 1}'),
                      labelStyle: getSemiBoldStyle(
                          color: AppColors.blackNormal, fontSize: FontSize.s18),
                      side: BorderSide(color: AppColors.fontLightDisabled),
                      showCheckmark: false,
                      selectedColor: AppColors.primaryNormal,
                      checkmarkColor: AppColors.primaryNormal,
                      selected: controller.meetingFrequency.value == index + 1,
                      onSelected: (selected) {
                        controller.meetingFrequency.value = index + 1;
                      },
                    );
                  }),
                ),
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
