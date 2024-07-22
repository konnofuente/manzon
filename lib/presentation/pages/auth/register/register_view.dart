import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
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
                'join_manzon_now'.tr,
                style: getBlackStyle(
                  color: AppColors.blackNormal,
                  fontSize: FontSize.s30,
                ),
              ),
              SizedBox(height: AppSize.s16),
              Text(
                "create_account_experience".tr,
                style: getSemiBoldStyle(
                  color: AppColors.grayNormal,
                  fontSize: FontSize.s16,
                ),
              ),
              SizedBox(height: verticalPadding),
              TextFieldWidget(
                labelText: "full_name".tr,
                hintText: "first_name".tr,
                prefixIcon: Icons.person,
                controller: controller.fullNameController,
                height: 60,
                isPassword: false,
                keyboardType: TextInputType.text,
                readOnly: false,
              ),
              SizedBox(height: AppSize.s12),
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
