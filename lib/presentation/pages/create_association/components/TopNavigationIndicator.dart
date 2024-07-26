import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import '../../../../app/config/theme/style_manager.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/core/utils/constants/value_manager.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';


class CustomNavigationBar extends StatelessWidget {
  final CreateAssociationController controller;

  CustomNavigationBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
                size: AppSize.s24,
                Icons.arrow_back,
                color: AppColors.blackNormal),
            onPressed: () {
              if (controller.currentStep.value == 0) {
                Get.back();
              } else {
                controller.previousStep();
              }
            },
          ),
          Obx(() {
            return StepProgressIndicator(
              totalSteps: controller.totalStep,
              currentStep: controller.currentStep.value + 1,
              selectedColor: AppColors.primaryNormal,
              unselectedColor: AppColors.primaryLightHover,
            );
          }),
          TextButton(
            onPressed: controller.nextStep,
            child: controller.currentStep.value < controller.totalStep ? Text('Skip',
                style: getRegularStyle(
                    fontSize: FontSize.s14,
                    color: AppColors.secondaryDarkHover)) : Container(),
          ),
        ],
      ),
    );
  }
}

class StepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final Color selectedColor;
  final Color unselectedColor;

  StepProgressIndicator({
    required this.totalSteps,
    required this.currentStep,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m8),
          width: AppSize.s32,
          height: AppSize.s4,
          decoration: BoxDecoration(
            color: index < currentStep ? selectedColor : unselectedColor,
            borderRadius: BorderRadius.circular(2.0),
          ),
        );
      }),
    );
  }
}
