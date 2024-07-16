import 'package:get/get.dart';
import 'package:manzon/presentation/pages/onboarding/splash_screen.dart';
import 'package:manzon/presentation/utils/constants/app_route_names.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: AppRouteNames.splash, page: () => SplashScreen()),
    GetPage(name: AppRouteNames.home, page: () => SplashScreen()),
  ];
}
