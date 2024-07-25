import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          CustomNavigationBar(controller: controller),
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
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final CreateAssociationController controller;

  CustomNavigationBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
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
              selectedColor: Colors.orange,
              unselectedColor: Colors.grey,
            );
          }),
          TextButton(
            onPressed: controller.nextStep,
            child: Text('Skip', style: TextStyle(color: Colors.grey)),
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
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: 24.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: index < currentStep ? selectedColor : unselectedColor,
            borderRadius: BorderRadius.circular(2.0),
          ),
        );
      }),
    );
  }
}
