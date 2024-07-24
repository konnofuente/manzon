import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import '../../../../app/core/utils/enums/export_enums.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:manzon/presentation/pages/auth/otp/otp_controller.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';

class OTPView extends StatefulWidget {
  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  @override
  Widget build(BuildContext context) {
    final OTPController controller = Get.put(OTPController());
    controller.onInit();
    final double verticalPadding = ScreenSize.screenHeight * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child: Text('otp_app_bar'.tr,
                style: getSemiBoldStyle(
                    fontSize: FontSize.s18, color: AppColors.blackNormal))),
        leading: IconButton(
          icon: const Icon(
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
              'verification_text'.tr,
              style: getRegularStyle(
                  fontSize: 16, color: AppColors.fontLightSecondary),
            ),
            SizedBox(height: verticalPadding),
            Text(
              '+237 699 442 188',
              style: getBoldStyle(fontSize: 16, color: AppColors.blackNormal),
            ),
            SizedBox(height: verticalPadding * 3),
            Expanded(
              child: OtpTextField(
                fieldHeight: AppSize.s70,
                // fieldWidth: AppSize.s,
                textStyle: getSemiBoldStyle(
                    fontSize: FontSize.s18, color: AppColors.fontLightPrimary),
                numberOfFields: 6,
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
            ),
            SizedBox(height: 16),
            Center(
              child: Obx(() => Text(
                    '${'resend_code'.tr} ${controller.remainingTime.value}s',
                    style: getMediumStyle(color: AppColors.fontLightDisabled),
                  )),
            ),
            SizedBox(height: 16),
            Center(
              child: Obx(() => TextButton(
                    onPressed: controller.remainingTime.value == 0
                        ? controller.resendOTP
                        : null,
                    child: Text(
                      'Resend Code',
                      style: getMediumStyle(
                          color: controller.remainingTime.value == 0
                              ? AppColors.primaryNormal
                              : AppColors.fontLightDisabled),
                    ),
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
                  text: 'confirm'.tr,
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
