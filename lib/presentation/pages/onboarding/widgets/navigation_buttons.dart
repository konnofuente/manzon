import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/enums/button_status.dart';
import 'package:manzon/presentation/widgets/buttons/rounded_button.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_controller.dart';

class NavigationButtons extends StatelessWidget {
  final OnboardingController controller;
  final double buttonHeight;
  final double horizontalPadding;

  const NavigationButtons({
    Key? key,
    required this.controller,
    required this.buttonHeight,
    required this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: controller.currentPage.value > 0
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          controller.currentPage.value > 0
              ? RoundedButton(
                  onTap: () => controller.previousPage(),
                  backgroundColor: AppColors.white,
                  status: ButtonState.enable,
                  contentColor: AppColors.primaryNormal,
                  hasElevation: false,
                  borderSize: 1.5,
                  icon: Icon(Icons.arrow_back, color: AppColors.primaryNormal),
                )
              : Container(),
          Spacer(),
          if (controller.currentPage.value < controller.onboardingPages.length - 1)
            RoundedButton(
              onTap: () => controller.nextPage(),
              backgroundColor: AppColors.primaryNormal,
              status: ButtonState.enable,
              contentColor: AppColors.white,
              hasElevation: false,
              icon: Icon(Icons.arrow_forward, color: AppColors.white),
            ),
        ],
      );
    });
  }
}
