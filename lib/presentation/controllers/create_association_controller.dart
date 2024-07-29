import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manzon/app/core/helpers/file_helper.dart';
import '../../domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/widgets/toast_utils.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import '../../domain/usecases/export_domain_repositories.dart';
import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/domain/usecases/associations/add_association_usecase.dart';

class CreateAssociationController extends GetxController {
  var currentStep = 0.obs;
  final pageController = PageController();
  final AddAssociationUseCase _addAssociationUseCase;
  final UploadAssociationAvatarUseCase _uploadAssociationAvatarUseCase;
  final ConnectivityService connectivityService = Get.find();

  CreateAssociationController(
      this._addAssociationUseCase, this._uploadAssociationAvatarUseCase);

  // Form data
  final RxString associationName = ''.obs;
  final RxString location = ''.obs;
  final RxString district = ''.obs;
  final RxInt meetingFrequency = 3.obs;
  final RxList<String> meetingDays = <String>[].obs;
  final RxString imagePath = ''.obs;
  XFile? avatar;
  MediaEntity? avatarMedia;
  final int totalStep = 5;
  var creationProgress = 0.obs;

  final TextEditingController associationNameController =
      TextEditingController();
  final TextEditingController headquaterTownController =
      TextEditingController();
  final TextEditingController headquaterLocationController =
      TextEditingController();

  void nextStep() {
    if (currentStep.value < totalStep - 1) {
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
    if (!await connectivityService.checkConnectivity()) {
      ToastUtils.showError(
        Get.context!,
        "No Internet Connection",
        "Please check your connection and try again.",
      );
      return;
    }

    try {
      creationProgress.value = 0;

      if (avatar != null) {
        avatarMedia = await _uploadAssociationAvatarUseCase.call(FileHelper.xFileToFile(avatar!));
        creationProgress.value = 50;
      } else {
        ToastUtils.showError(
          Get.context!,
          "No Avatar",
          "Please upload an avatar image.",
        );
        return;
      }

      if (avatarMedia != null) {
        final association = AssociationEntity(
          uniqueId: Uuid().v4(),
          headquaterCity: headquaterTownController.text,
          meetingDays: meetingDays.value,
          headquaterLocation: headquaterLocationController.text,
          name: associationNameController.text,
          avatar: avatarMedia!,
        );

        await _addAssociationUseCase.call(association);
        creationProgress.value = 100;
        ToastUtils.showSuccess(
          Get.context!,
          "Success",
          "Association added successfully.",
        );
      }
    } catch (e) {
      ToastUtils.showError(
        Get.context!,
        "Error",
        "Failed to add association. Please try again later.",
      );
    }
  }


void createAssociation() async {
  Get.toNamed(AppRouteNames.createAssociationLoader);
  await addAssociation();
}

}
