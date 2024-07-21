import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  List<Map<String, String>> onboardingPages = [
    {
      "title": "Notifications Automatiques",
      "description": "Recevez des notifications instantanées pour les contributions, les prêts et les événements importants.",
      "image": "https://via.placeholder.com/390x616"
    },
    {
      "title": "Suivi et Transparence",
      "description": "Suivez les contributions et les prêts en temps réel avec une transparence totale.",
      "image": "https://via.placeholder.com/390x616"
    },
    {
      "title": "Gestion des Prêts",
      "description": "Aidez votre tontine à gérer efficacement les prêts et les remboursements.",
      "image": "https://via.placeholder.com/390x616"
    }
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
}
