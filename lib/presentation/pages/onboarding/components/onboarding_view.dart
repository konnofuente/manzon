import 'package:flutter/material.dart';
import '../../../utils/theme/app_colors.dart';
import '../widgets/navigation_indicator.dart';
import '../../../utils/theme/font_manager.dart';
import '../../../utils/theme/style_manager.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_controller.dart';




Widget buildPageContent(OnboardingController controller, double verticalPadding, double horizontalPadding) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      NavigationIndicatorWidget(controller: controller,),
      SizedBox(height: verticalPadding),
      SizedBox(
        width: double.infinity,
        child: Text(
          controller.onboardingPages[controller.currentPage.value]["title"]!,
          style: getBoldStyle(color: AppColors.blackNormal),
        ),
      ),
      SizedBox(height: verticalPadding),
      SizedBox(
        width: double.infinity,
        child: Text(
          controller.onboardingPages[controller.currentPage.value]["description"]!,
          style: getSemiBoldStyle(
            fontSize: FontSize.s16,
            color: AppColors.fontLightSecondary,
          ),
        ),
      ),
    ],
  );
}