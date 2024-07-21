import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';
import 'package:manzon/presentation/utils/theme/style_manager.dart';
import 'package:manzon/presentation/utils/constants/value_manager.dart';
import 'package:manzon/presentation/utils/constants/assets_manager.dart';
import 'package:manzon/presentation/utils/theme/export_theme_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: ScreenUtils.blockSizeHorizontal * 70,
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
                'Simplifiez votre gestion immobilière et la vie en colocation',
                textAlign: TextAlign.center,
                style: getRegularStyle(fontSize: FontSize.s14, color: AppColors.fontLightSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
