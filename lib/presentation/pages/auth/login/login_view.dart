import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/text_field_widget.dart';
import 'package:manzon/app/core/utils/validations/form_validators.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/pages/auth/login/login_controller.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    final double horizontalPadding = ScreenSize.screenWidth * 0.08;
    final double verticalPadding = AppSize.s40;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: verticalPadding),
              Text(
                'happy_return'.tr,
                style: getBlackStyle(
                  color: AppColors.blackNormal,
                  fontSize: FontSize.s30,
                ),
              ),
              SizedBox(height: AppSize.s16),
              Text(
                "reconnect_to_manzon".tr,
                style: getSemiBoldStyle(
                  color: AppColors.grayNormal,
                  fontSize: FontSize.s16,
                ),
              ),
              SizedBox(height: verticalPadding),
              TextFieldWidget(
                labelText: "phone".tr,
                hintText: "enter_phone_number".tr,
                prefixIcon: Icons.phone,
                controller: controller.phoneNumberController,
                validator: FormValidators.validatePhoneNumber,
                height: 60,
                isPassword: false,
                keyboardType: TextInputType.phone,
                readOnly: false,
              ),
              SizedBox(height: AppSize.s12),
              TextFieldWidget(
                labelText: "password".tr,
                hintText: "enter_password".tr,
                prefixIcon: Icons.lock,
                controller: controller.passwordController,
                height: 60,
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                readOnly: false,
              ),
              SizedBox(height: AppSize.s4),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // _onForgotPasswordTap();
                      },
                      child: Text('forgot_password'.tr,
                          style: getRegularStyle(
                              fontSize: FontSize.s14,
                              color: AppColors.primaryNormal)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: verticalPadding),
              DefaultButton(
                onTap: controller.login,
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
                  "or_continue_with".tr,
                  style: getRegularStyle(
                    color: AppColors.fontLightDisabled,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
              SizedBox(height: AppSize.s10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(IconAssets.facebookIcon),
                    onPressed: () => print('Facebook Pressed'),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      IconAssets.googleIcon,
                    ),
                    onPressed: () => print('Google Pressed'),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      IconAssets.appleIcon,
                    ),
                    onPressed: () => print('Apple Pressed'),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s10),
              Center(
                child: Text(
                  "no_account".tr,
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
