import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
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
              left: 0,
              top: 0,
              child: Container(
                width: ScreenSize.screenWidth,
                height: ScreenSize.blockSizeVertical * 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.onboardingPages[controller.currentPage.value]["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: ScreenSize.blockSizeVertical * 45,
              child: Container(
                height: ScreenSize.blockSizeVertical * 45,
                padding: EdgeInsets.only(top: verticalPadding * 4, bottom: verticalPadding),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: ScreenSize.blockSizeHorizontal * 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                             
                                      SizedBox(height: verticalPadding),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                controller.onboardingPages[controller.currentPage.value]["title"]!,
                                                style: TextStyle(
                                                  color: Color(0xFF2E2E2E),
                                                  fontSize: ScreenSize.screenWidth * 0.077,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2,
                                                  letterSpacing: -0.6,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: verticalPadding),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                controller.onboardingPages[controller.currentPage.value]["description"]!,
                                                style: TextStyle(
                                                  color: Color(0xFF606060),
                                                  fontSize: ScreenSize.screenWidth * 0.041,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: verticalPadding),
                          Container(
                            width: ScreenSize.screenWidth,
                            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => controller.previousPage(),
                                  child: Container(
                                    width: ScreenSize.screenWidth * 0.12,
                                    height: ScreenSize.blockSizeVertical * 0.06,
                                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.5, color: Color(0xFFC27F33)),
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Transform(
                                          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                                          child: Icon(Icons.arrow_forward, color: Color(0xFFC27F33)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.nextPage(),
                                  child: Container(
                                    width: ScreenSize.screenWidth * 0.12,
                                    height: ScreenSize.blockSizeVertical * 0.06,
                                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFC38029),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_forward, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
