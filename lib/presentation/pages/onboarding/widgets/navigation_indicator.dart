import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_controller.dart';

class NavigationIndicatorWidget extends StatelessWidget {
  final OnboardingController controller;

  const NavigationIndicatorWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        controller.onboardingPages.length,
        (index) => Container(
          width: 28,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: ShapeDecoration(
            color: controller.currentPage.value == index
                ? AppColors.primaryNormal
                : AppColors.blackLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
