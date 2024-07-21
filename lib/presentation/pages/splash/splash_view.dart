import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/constants/assets_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              LogoAssets.appLogo,
              semanticsLabel: 'Manzon logo',
              height: 100,
              width: 100,
            ),
             SizedBox(height: ScreenUtils.blockSizeVertical * 2), 
            Text(
              'Simplifiez votre gestion immobilière et la vie en colocation',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtils.blockSizeHorizontal * 4,
                color: AppColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
