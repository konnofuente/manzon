import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/enums/export_enums.dart';
import 'package:manzon/presentation/widgets/text_field_widget.dart';
import 'package:manzon/app/core/utils/validations/form_validators.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';
import 'package:manzon/presentation/controllers/authentification/auth_controller.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final AuthentificationController controller = Get.find();
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
              IntlPhoneField(
                decoration: InputDecoration(
                  hintText: 'enter_phone_number'.tr,
                  errorStyle: getRegularStyle(
                      fontSize: AppSize.s12, color: AppColors.error),
                  hintStyle: getRegularStyle(
                      fontSize: AppSize.s16,
                      color: AppColors.fontLightDisabled),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.error),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.fontLightDisabled),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.primaryNormal),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.fontLightSecondary),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: AppPadding.p22, horizontal: AppPadding.p20),
                ),
                initialCountryCode: 'CM', // Default country code
                invalidNumberMessage: "invalid_number_format".tr,
                onChanged: (phone) {
                  controller.phoneNumberController.text = phone.completeNumber;
                },
              ),
              SizedBox(height: verticalPadding),
              Obx(
                () => DefaultButton(
                  onTap: controller.verifyPhoneNumber,
                  status: controller.isLoadingButton.value
                      ? ButtonState.loading
                      : ButtonState.enable,
                  height: AppSize.s60,
                  backgroundColor: AppColors.primaryNormal,
                  text: 'continue'.tr,
                  width: double.infinity,
                  fontWeight: FontWeight.w600,
                  borderRadius: 50.0,
                ),
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
