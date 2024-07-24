import 'package:get/get.dart';
import 'package:manzon/app/core/utils/constants/assets_manager.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  List<Map<String, String>> onboardingPages = [
    {
      "title": "Notifications Automatiques",
      "description": "Recevez des notifications instantanées pour les contributions, les prêts et les événements importants.",
      "image": ImageAssets.onboarding1
    },
    {
      "title": "Suivi et Transparence",
      "description": "Suivez les contributions et les prêts en temps réel avec une transparence totale.",
      "image": ImageAssets.onboarding2
    },
    {
      "title": "Gestion des Prêts",
      "description": "Aidez votre tontine à gérer efficacement les prêts et les remboursements.",
      "image": ImageAssets.onboarding3
    },
    {
      "title": "Gestion des Prêts",
      "description": "Aidez votre tontine à gérer efficacement les prêts et les remboursements.",
      "image": ImageAssets.onboarding3
    },
  ];

  void nextPage() {
    if (currentPage < onboardingPages.length - 1) {
      currentPage++;
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Print the image path to debug
    // ever(currentPage, (_) => print(onboardingPages[currentPage.value]["image"]));
  }
}
