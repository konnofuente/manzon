import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/font_manager.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/text_field_widget.dart';
import 'package:manzon/presentation/pages/login/login_controller.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/utils/constants/export_constant_manager.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    final double horizontalPadding = ScreenSize.screenWidth * 0.08;
    final double verticalPadding = ScreenSize.screenHeight * 0.02;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: verticalPadding * 3),
            Text(
              "Rejoignez Manzon dès maintenant !",
              style: getBlackStyle(
                color: AppColors.blackNormal,
                fontSize: FontSize.s30,
              ),
            ),
            SizedBox(height:AppSize.s16 ),
            Text(
              "Creez votre compte et Commencez votre expérience personnalisée maintenant.",
              style: getSemiBoldStyle(
                color: AppColors.grayNormal,
                fontSize: FontSize.s16,
              ),
            ),
            SizedBox(height: verticalPadding * 2),
            Obx(() => TextFieldWidget(
              hintText: "First Name",
              prefixIcon: Icons.person,
              onChanged: controller.updateFullName,
              initialValue: controller.state.fullName.value,
            )),
            SizedBox(height: verticalPadding),
            Obx(() => TextFieldWidget(
              hintText: "Enter your phone number",
              prefixIcon: Icons.phone,
              onChanged: controller.updatePhoneNumber,
              initialValue: controller.state.phoneNumber.value,
            )),
            SizedBox(height: verticalPadding * 2),
            DefaultButton(
              onTap: controller.login,
              backgroundColor: AppColors.primaryNormal,
              text: 'Continuer',
              width: double.infinity,
              fontWeight: FontWeight.w600,
              borderRadius: 50.0,
            ),
            SizedBox(height: verticalPadding * 2),
            Center(
              child: Text(
                "Ou continuez avec",
                style: getRegularStyle(
                  color: AppColors.fontLightSecondary,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
            SizedBox(height: verticalPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook, color: AppColors.primaryNormal),
                  onPressed: () => print('Facebook Pressed'),
                ),
                IconButton(
                  icon: Icon(Icons.g_translate, color: AppColors.primaryNormal),
                  onPressed: () => print('Google Pressed'),
                ),
                IconButton(
                  icon: Icon(Icons.apple, color: AppColors.primaryNormal),
                  onPressed: () => print('Apple Pressed'),
                ),
              ],
            ),
            SizedBox(height: verticalPadding * 2),
            Center(
              child: Text(
                "Already Have an Account",
                style: getBoldStyle(
                  color: AppColors.primaryNormal,
                  fontSize: FontSize.s16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
