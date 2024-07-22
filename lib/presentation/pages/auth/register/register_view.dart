import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/font_manager.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/text_field_widget.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/utils/validations/form_validators.dart';
import 'package:manzon/presentation/pages/auth/register/register_controller.dart';
import 'package:manzon/presentation/utils/constants/export_constant_manager.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
    final double verticalPadding = AppSize.s40;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: verticalPadding * 2),
              Text(
                'create_account'.tr,
                style: getBlackStyle(
                  color: AppColors.blackNormal,
                  fontSize: FontSize.s30,
                ),
              ),
              SizedBox(height: AppSize.s16),
              SizedBox(height: verticalPadding),
              TextFieldWidget(
                hintText: "first_name".tr,
                prefixIcon: Icons.person,
                controller: controller.fullNameController,
                height: 70,
                isPassword: false,
                keyboardType: TextInputType.text,
                readOnly: false,
              ),
              SizedBox(height: AppSize.s12),
              TextFieldWidget(
                hintText: "enter_phone_number".tr,
                prefixIcon: Icons.phone,
                controller: controller.phoneNumberController,
                validator: FormValidators.validatePhoneNumber,
                height: 70,
                isPassword: false,
                keyboardType: TextInputType.phone,
                readOnly: false,
              ),
              SizedBox(height: verticalPadding),
              DefaultButton(
                onTap: controller.register,
                height: AppSize.s60,
                backgroundColor: AppColors.primaryNormal,
                text: 'continue'.tr,
                width: double.infinity,
                fontWeight: FontWeight.w600,
                borderRadius: 50.0,
              ),
              SizedBox(height: verticalPadding),
              Center(
                child: Text(
                  "already_have_an_account".tr,
                  style: getBoldStyle(
                    color: AppColors.primaryNormal,
                    fontSize: FontSize.s16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
