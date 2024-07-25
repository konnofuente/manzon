import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/text_field_widget.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class Headquarters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quel est le siege de votre association?',
            style: getBoldStyle(color: AppColors.blackNormal, fontSize: 16),
          ),
          SizedBox(height: 16),
          TextFieldWidget(
            hintText: "Yaounde",
            controller: TextEditingController(),
            height: 70,
            isPassword: false,
            keyboardType: TextInputType.text,
            readOnly: false,
          ),
          SizedBox(height: 16),
          TextFieldWidget(
            hintText: "Nkomo II",
            controller: TextEditingController(),
            height: 70,
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
