import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/pages/splash/splash_controller.dart';
import 'package:manzon/presentation/utils/theme/export_theme_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: ScreenSize.blockSizeHorizontal * 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    LogoAssets.appLogo,
                    semanticsLabel: 'Manzon logo',
                    height: AppSize.s100,
                    width: AppSize.s100,
                  ),
                  const SizedBox(height: AppSize.s16),
                  Text(
                    'splash_description'.tr,
                    textAlign: TextAlign.center,
                    style: getRegularStyle(
                      fontSize: FontSize.s14,
                      color: AppColors.fontLightSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child: Text(
                'power_by_manzon'.tr,
                style: getRegularStyle(
                  fontSize: FontSize.s14,
                  color: AppColors.fontLightSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
