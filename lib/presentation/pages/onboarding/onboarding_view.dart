import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/utils/theme/export_theme_manager.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_controller.dart';
import 'package:manzon/presentation/pages/onboarding/widgets/navigation_buttons.dart';
import 'package:manzon/presentation/pages/onboarding/components/onboarding_view.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final double horizontalPadding = ScreenSize.screenWidth * 0.04;
    final double verticalPadding = ScreenSize.screenHeight * 0.02;

    return Scaffold(
      body: Obx(() {
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: ScreenSize.screenWidth,
                height: ScreenSize.blockSizeVertical * 55,
                child: SvgPicture.asset(
                  height: ScreenSize.blockSizeVertical * 50,
                  width: ScreenSize.screenWidth,
                  controller.onboardingPages[controller.currentPage.value]["image"]!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              left: 0,
              top: ScreenSize.blockSizeVertical * 55,
              child: Center(
                child: Container(
                  height: ScreenSize.blockSizeVertical * 45,
                  padding: EdgeInsets.only(
                    top: verticalPadding * 4, bottom: verticalPadding
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [AppColors.white.withOpacity(0),AppColors.white],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: buildPageContent(
                          controller, verticalPadding, horizontalPadding
                        ),
                      ),
                      SizedBox(height: verticalPadding),
                      controller.currentPage.value ==
                              controller.onboardingPages.length - 1
                          ? Center(
                              child: Container(
                                width: ScreenSize.screenWidth,
                                height: ScreenSize.blockSizeVertical * 10,
                                padding: EdgeInsets.symmetric(
                                    horizontal: horizontalPadding),
                                child: Column(
                                  children: [
                                    DefaultButton(
                                      onTap: () => print('Button Pressed'),
                                      backgroundColor: AppColors.primaryNormal,
                                      text: 'get_start'.tr,
                                      textStyle: getSemiBoldStyle(fontSize: FontSize.s16, color: AppColors.white),
                                      width: double.infinity,
                                      fontWeight: FontWeight.w600,
                                      borderRadius: AppRadius.r50,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: verticalPadding,
              left: horizontalPadding,
              right: horizontalPadding,
              child: NavigationButtons(
                controller: controller,
                buttonHeight: ScreenSize.blockSizeVertical * 6,
                horizontalPadding: horizontalPadding,
              ),
            ),
          ],
        );
      }),
    );
  }
}
