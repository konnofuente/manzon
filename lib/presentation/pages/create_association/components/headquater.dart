import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
            'Quel est le siege de votre association?',
            style: getMediumStyle(
                color: AppColors.blackNormal, fontSize: FontSize.s16),
          ),
          const SizedBox(height: AppSize.s8),
          TextFieldWidget(
            prefixIcon: Icons.location_city,
            hintText: "Yaounde",
            controller: TextEditingController(),
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
            hintText: "Nkomo II",
            controller: TextEditingController(),
            isPassword: false,
            keyboardType: TextInputType.text,
            readOnly: false,
          ),
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
