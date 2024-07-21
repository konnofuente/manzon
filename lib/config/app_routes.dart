import 'package:get/get.dart';
import 'package:manzon/presentation/pages/splash/splash_view.dart';
import 'package:manzon/presentation/utils/constants/app_route_names.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_screen.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: AppRouteNames.splash, page: () => const SplashView()),
    GetPage(name: AppRouteNames.onboarding, page: () => onBoarding()),
  ];
}
