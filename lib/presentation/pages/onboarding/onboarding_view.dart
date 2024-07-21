import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_theme.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/font_manager.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_controller.dart';

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
                height: ScreenSize.blockSizeVertical * 60,
                child: SvgPicture.asset(
                  height: ScreenSize.blockSizeVertical * 50,
                  width: ScreenSize.screenWidth,
                  controller.onboardingPages[controller.currentPage.value]
                      ["image"]!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              left: 0,
              top: ScreenSize.blockSizeVertical * 60,
              child: Center(
                child: Container(
                  height: ScreenSize.blockSizeVertical * 40,
                  padding: EdgeInsets.only(
                      top: verticalPadding * 4, bottom: verticalPadding),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Colors.white.withOpacity(0), Color(0xFFFBFBFD)],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            // indicator 
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 28,
                                  height: 4,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFC38029),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 28,
                                  height: 4,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEBEBEB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 28,
                                  height: 4,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEBEBEB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                controller.onboardingPages[
                                    controller.currentPage.value]["title"]!,
                                style:
                                    getBoldStyle(color: AppColors.blackNormal),
                              ),
                            ),
                            SizedBox(height: verticalPadding),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                controller.onboardingPages[controller
                                    .currentPage.value]["description"]!,
                                style: getSemiBoldStyle(
                                  fontSize: FontSize.s16,
                                    color: AppColors.fontLightSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: verticalPadding),
                      Center(
                        child: Container(
                          width: ScreenSize.screenWidth,
                          height: ScreenSize.blockSizeVertical * 10,
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => controller.previousPage(),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1.5,
                                            color: Color(0xFFC27F33)),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Icon(Icons.arrow_back,
                                        color: Color(0xFFC27F33)),
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => controller.nextPage(),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFC38029),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
