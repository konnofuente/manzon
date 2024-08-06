import 'package:get/get.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/presentation/pages/home/home_view.dart';
import 'package:manzon/presentation/pages/auth/otp/otp_view.dart';
import 'package:manzon/presentation/pages/splash/splash_view.dart';
import 'package:manzon/presentation/pages/auth/login/login_view.dart';
import 'package:manzon/presentation/pages/onboarding/onboarding_view.dart';
import 'package:manzon/presentation/pages/auth/register/register_view.dart';
import 'package:manzon/presentation/pages/auth/user_role/user_role_view.dart';
import 'package:manzon/presentation/pages/association_page/association_page.dart';
import 'package:manzon/presentation/pages/create_tontine/create_tontine_page.dart';
import 'package:manzon/presentation/pages/create_association/export_create_association.dart';


class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: AppRouteNames.splash, page: () => const SplashView()),
    GetPage(name: AppRouteNames.onboarding, page: () => OnboardingView()),
    GetPage(name: AppRouteNames.register, page: () => RegisterView()),
    GetPage(name: AppRouteNames.login, page: () => LoginView()),
    GetPage(name: AppRouteNames.userRole, page: () => UserRoleView()),
    GetPage(name: AppRouteNames.otp, page: () => OTPView()),
    GetPage(name: AppRouteNames.home, page: () => HomeView()),
    GetPage(name: AppRouteNames.createAssociation, page: () => CreateAssociation()),
    GetPage(name: AppRouteNames.createAssociationLoader, page: () => CreateAssociationLoading()),
    GetPage(name: AppRouteNames.associationPage, page: () => AssociationPage()),
    GetPage(name: AppRouteNames.createTontinePage, page: () => CreateTontinePage()),
  ];
}
