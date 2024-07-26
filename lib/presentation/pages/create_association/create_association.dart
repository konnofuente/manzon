import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';
import 'package:manzon/presentation/pages/create_association/components/headquater.dart';
import 'package:manzon/presentation/pages/create_association/components/meeting_days.dart';
import 'package:manzon/presentation/pages/create_association/components/verification.dart';
import 'package:manzon/presentation/pages/create_association/components/basic_information.dart';
import 'package:manzon/presentation/pages/create_association/components/meeting_frequency.dart';

class CreateAssociation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller =
        Get.put(CreateAssociationController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.horizontalPadding),
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFFBFBFD)),
          child: Column(
            children: [
              CustomNavigationBar(controller: controller),
              Text(
                'Creer une association',
                style: getBlackStyle(
                    fontSize: FontSize.s24, color: AppColors.blackNormal),
              ),
              SizedBox(
                height: AppSize.s40,
              ),
              Expanded(
                  child: PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BasicInformation(),
                  Headquarters(),
                  MeetingFrequency(),
                  MeetingDays(),
                  Verification(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

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
            icon: Icon(
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
              totalSteps: 5,
              currentStep: controller.currentStep.value + 1,
              selectedColor: AppColors.primaryNormal,
              unselectedColor: AppColors.primaryLightHover,
            );
          }),
          TextButton(
            onPressed: controller.nextStep,
            child: Text('Skip',
                style: getRegularStyle(
                    fontSize: FontSize.s14,
                    color: AppColors.secondaryDarkHover)),
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
          margin: EdgeInsets.symmetric(horizontal: AppMargin.m8),
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
