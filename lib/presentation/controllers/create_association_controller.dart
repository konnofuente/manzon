import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manzon/presentation/widgets/toast_utils.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/domain/usecases/associations/add_association_usecase.dart';

class CreateAssociationController extends GetxController {
  var currentStep = 0.obs;
  final pageController = PageController();
  final AddAssociationUseCase _addAssociationUseCase;
  final ConnectivityService connectivityService = Get.find();

  CreateAssociationController(
    this._addAssociationUseCase,
  );

  // Form data
  final RxString associationName = ''.obs;
  final RxString location = ''.obs;
  final RxString district = ''.obs;
  final RxInt meetingFrequency = 3.obs;
  final RxList<String> meetingDays = <String>[].obs;
  final RxString imagePath = ''.obs;
  late final XFile avatar;
  var totalStep = 5;

  final TextEditingController associationNameController =
      TextEditingController();
  final TextEditingController headquaterTownController =
      TextEditingController();
  final TextEditingController headquaterLocationController =
      TextEditingController();

  void nextStep() {
    if (currentStep.value < 4) {
      currentStep.value++;
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
      pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  Future<void> addAssociation() async {
    bool isConnected = await connectivityService.checkConnectivity();

    AssociationEntity association = AssociationEntity(
        headquaterCity: headquaterTownController.text,
        meetingDays: meetingDays.value,
        headquaterLocation: headquaterLocationController.text,
        name: associationNameController.text);

    if (!isConnected) {
      ToastUtils.showError(
        Get.context!,
        "No Internet Connection",
        "Please check your connection and try again.",
      );
      return;
    }

    try {
      _addAssociationUseCase.call(association);
    } catch (e) {
      ToastUtils.showError(
        Get.context!,
        "Error",
        "Failed to add user. Please try again later.",
      );
    }
  }
}
