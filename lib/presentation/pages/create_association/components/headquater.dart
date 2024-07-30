import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/helpers/keyboard.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import '../../../../app/core/utils/constants/value_manager.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/widgets/text_field_widget.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class Headquarters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();
    final double verticalPadding = AppSize.s24;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'what_is_the_headquarters_of_your_association'.tr,
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
          ),
          const SizedBox(height: AppSize.s8),
          TextFieldWidget(
            prefixIcon: Icons.location_city,
            hintText: "yaounde".tr,
            controller: controller.headquaterTownController,
            isPassword: false,
            keyboardType: TextInputType.text,
            readOnly: false,
          ),
          SizedBox(height: verticalPadding),
          Text(
            'Quel est le siege de votre association?',
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
          ),
          const SizedBox(height: AppSize.s8),
          TextFieldWidget(
            prefixIcon: Icons.location_on,
            hintText: "nkomo_ii".tr,
            controller: controller.headquaterLocationController,
            isPassword: false,
            keyboardType: TextInputType.text,
            readOnly: false,
          ),
          Spacer(),
          DefaultButton(
            onTap: () {
              controller.nextStep();
                hideKeyboard(context);
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
