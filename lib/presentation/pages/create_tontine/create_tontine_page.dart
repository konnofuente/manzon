import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/create_tontine_controller.dart';
import '../../../infrastructure/data_sources/firebase/tontine_data_source.dart';
import 'package:manzon/presentation/pages/create_tontine/components/export_create_tonine_component.dart';

class CreateTontinePage extends StatelessWidget {
  final CreateTontineController controller =
      Get.put(CreateTontineController(Get.put(TontineDataSource())));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentStep.value > 0) {
          controller.previousStep();
          return false; // Prevent default back navigation
        }
        return true; // Allow default back navigation
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(ScreenSize.horizontalPadding),
          child: Container(
            decoration: BoxDecoration(color: AppColors.white),
            child: Column(
              children: [
                CustomNavigationBar(controller: controller),
                Expanded(
                    child: PageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OrderMembers(),
                    TontineInformation(),
                    FinancialInformation(),
                    VerificationScreen(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final CreateTontineController controller;

  CustomNavigationBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
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
            child: controller.currentStep.value < controller.totalStep
                ? Text('Skip',
                    style: getRegularStyle(
                        fontSize: FontSize.s14,
                        color: AppColors.secondaryDarkHover))
                : Container(),
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
