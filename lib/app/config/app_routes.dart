import 'package:get/get.dart';
import 'package:manzon/presentation/pages/splash/splash_view.dart';
import 'package:manzon/presentation/pages/auth/login/login_view.dart';
import 'package:manzon/presentation/utils/constants/app_route_names.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_view.dart';
import 'package:manzon/presentation/pages/auth/register/register_view.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: AppRouteNames.splash, page: () => const SplashView()),
    GetPage(name: AppRouteNames.onboarding, page: () => OnboardingView()),
    GetPage(name: AppRouteNames.register, page: () => RegisterView()),
    GetPage(name: AppRouteNames.login, page: () => LoginView()),
  ];
}
