import 'package:flutter/material.dart';
import '../widgets/navigation_indicator.dart';
import '../../../../app/config/theme/app_colors.dart';
import '../../../../app/config/theme/font_manager.dart';
import '../../../../app/config/theme/style_manager.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_controller.dart';

Widget buildPageContent(OnboardingController controller, double verticalPadding,
    double horizontalPadding) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      NavigationIndicatorWidget(
        controller: controller,
      ),
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
          controller.onboardingPages[controller.currentPage.value]
              ["description"]!,
          style: getSemiBoldStyle(
            fontSize: FontSize.s18,
            color: AppColors.fontLightSecondary,
          ),
        ),
      ),
    ],
  );
}
