import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/constants/value_manager.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class MeetingDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month_outlined,
                    color: AppColors.grayNormal, size: AppSize.s24),
                SizedBox(
                  width: AppSize.s8,
                ),
                Text(
                  'select_meeting_days'.tr,
                  style: getCustomStyle(
                    color: AppColors.blackNormal,
                    fontSize: FontSize.s16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize.s16),
          Obx(() => Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: [
                    'monday'.tr,
                    'tuesday'.tr,
                    'wednesday'.tr,
                    'thursday'.tr,
                    'friday'.tr,
                    'saturday'.tr,
                    'sunday'.tr
                  ].map((day) {
                    return FilterChip(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                      labelStyle: getSemiBoldStyle(
                          color: AppColors.blackNormal, fontSize: FontSize.s18),
                      showCheckmark: false,
                      side: BorderSide(color: AppColors.fontLightDisabled),
                      selectedColor: AppColors.primaryNormal,
                      checkmarkColor: AppColors.primaryNormal,
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
                ),
              )),
          Spacer(),
          DefaultButton(
            onTap: () {
              controller.nextStep();
            },
            backgroundColor: AppColors.primaryNormal,
            text: 'continue'.tr,
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          ),
        ],
      ),
    );
  }
}
