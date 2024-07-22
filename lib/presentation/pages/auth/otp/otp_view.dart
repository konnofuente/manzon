import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../utils/enums/export_enums.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:manzon/presentation/pages/auth/otp/otp_controller.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/utils/theme/export_theme_manager.dart';

class OTPView extends StatefulWidget {
  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  @override
  Widget build(BuildContext context) {
    final OTPController controller = Get.put(OTPController());
    final double verticalPadding = ScreenSize.screenHeight * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child: Text('Verification OTP',
                style: getSemiBoldStyle(
                    fontSize: FontSize.s18, color: AppColors.blackNormal))),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.s24,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: verticalPadding * 2),
            Text(
              'Nous vous avons envoyé un code de vérification au',
              style: getRegularStyle(
                  fontSize: 16, color: AppColors.fontLightSecondary),
            ),
            SizedBox(height: verticalPadding),
            Text(
              '+237 699 442 188',
              style: getBoldStyle(fontSize: 16, color: AppColors.blackNormal),
            ),
            SizedBox(height: verticalPadding * 3),
            OtpTextField(
              fieldHeight: AppSize.s70,
              fieldWidth: AppSize.s70,
              textStyle: getSemiBoldStyle(
                  fontSize: FontSize.s18, color: AppColors.fontLightPrimary),
              numberOfFields: 4,
              enabledBorderColor: AppColors.fontLightDisabled,
              borderColor: AppColors.primaryNormal,
              focusedBorderColor: AppColors.primaryNormal,
              borderWidth: 1,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.setOTP(verificationCode);
              },
            ),
            SizedBox(height: 16),
            Center(
              child: Obx(() => Text(
                    'On va vous renvoyer un code dans ${controller.remainingTime.value}s',
                    style: getMediumStyle(color: AppColors.fontLightDisabled),
                  )),
            ),
            Spacer(),
            Obx(() => DefaultButton(
                  onTap: controller.isButtonEnabled.value
                      ? controller.verifyOTP
                      : null,
                  backgroundColor: controller.isButtonEnabled.value
                      ? AppColors.primaryNormal
                      : AppColors.fontLightDisabled,
                  status: controller.isButtonEnabled.value
                      ? ButtonState.enable
                      : ButtonState.disable,
                  text: 'Confirmer',
                  width: double.infinity,
                  fontWeight: FontWeight.w600,
                  borderRadius: 50.0,
                )),
            SizedBox(height: verticalPadding * 2),
          ],
        ),
      ),
    );
  }
}
