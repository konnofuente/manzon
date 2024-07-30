import 'dart:developer';
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
import 'package:manzon/infrastructure/services/local_storage_service.dart';

class CreateAssociationController extends GetxController {
  var currentStep = 0.obs;
  final pageController = PageController();
  final AddAssociationUseCase _addAssociationUseCase;
  final UploadAssociationAvatarUseCase _uploadAssociationAvatarUseCase;
  final AddMemberToAssociationUseCase _addMemberToAssociationUseCase;
  // final UpdateUserUseCase _updateUserUseCase;
  final UpdateUserWithMembership _updateUserWithMembership;
  final ConnectivityService connectivityService = Get.find();
  final LocalStorageService _localStorageService =
      Get.put(LocalStorageService());

  CreateAssociationController(
    this._addAssociationUseCase,
    this._uploadAssociationAvatarUseCase,
    this._addMemberToAssociationUseCase,
    this._updateUserWithMembership,
  );

  // Form Data
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

  @override
  void onClose() {
    super.onClose();
    resetState();
  }

  void resetState() {
    currentStep.value = 0;
    associationName.value = '';
    location.value = '';
    district.value = '';
    meetingFrequency.value = 3;
    meetingDays.clear();
    imagePath.value = '';
    avatar = null;
    avatarMedia = null;
    creationProgress.value = 0;
    associationNameController.clear();
    headquaterTownController.clear();
    headquaterLocationController.clear();
  }

  void nextStep() {
    if (currentStep.value < totalStep - 1) {
      if (currentStep.value == 0 && associationNameController.text.isEmpty) {
        ToastUtils.showError(Get.context!, "Required information",
            "Please enter the association name");
        return;
      }

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
      showError("No Internet Connection",
          "Please check your connection and try again.");
      return;
    }

    try {
      creationProgress.value = 0;
      creationProgress.value = 10;

      if (avatar != null) {
        avatarMedia = await _uploadAssociationAvatarUseCase
            .call(FileHelper.xFileToFile(avatar!));
        creationProgress.value = 40;
      }

      // if (avatarMedia == null) return;

      UserEntity? user = await _localStorageService.getUser();
      creationProgress.value = 60;

      if (user == null) {
        showError("Error", "Failed to get user information. Please try again.");
        return;
      }

      final association = createAssociationEntity(user);
      final createdAssociation = await _addAssociationUseCase.call(association);
      log('this is the association created $createdAssociation');
      creationProgress.value = 80;

      if (createdAssociation == null) {
        print('association is null');
        showError(
            "Error", "Failed to add association. Please try again later.");
        return;
      }

      // await addMemberToAssociation(createdAssociation, user);
      // creationProgress.value = 80;

      await updateUserWithMembership(user, createdAssociation.uniqueId!);
      creationProgress.value = 100;

      ToastUtils.showSuccess(
          Get.context!, "Success", "Association added successfully.");
      Get.toNamed(AppRouteNames.home);
      resetState();
    } catch (e) {
      showError("Error", "Failed to add association. Please try again later.");
    }
  }

  void showError(String title, String message) {
    ToastUtils.showError(Get.context!, title, message);
  }

  AssociationEntity createAssociationEntity(UserEntity user) {
    return AssociationEntity(
      uniqueId: Uuid().v4(),
      headquaterCity: headquaterTownController.text,
      monthlyMeetingFrequency: meetingFrequency.value,
      meetingDays: meetingDays.value,
      headquaterLocation: headquaterLocationController.text,
      name: associationNameController.text,
      avatar: avatarMedia ?? null,
      members: [
        MemberEntity(
          id: Uuid().v4(),
          name: user.name ?? "",
          role: Role.admin.toString(),
          userId: user.id,
        ),
      ],
      adminIds: [user.id],
    );
  }

  Future<void> addMemberToAssociation(
      AssociationEntity createdAssociation, UserEntity user) async {
    try {
      await _addMemberToAssociationUseCase.call(
        createdAssociation.uniqueId!,
        MemberEntity(
          id: Uuid().v4(),
          name: user.name ?? "",
          role: Role.admin.toString(),
          userId: user.id,
        ),
      );
    } catch (e) {
      log('Failed to add member to association: $e'); // You can replace this with your preferred error logging method
      throw Exception('Failed to add member to association');
    }
  }

  Future<void> updateUserWithMembership(
      UserEntity user, String associationId) async {
    AssociationMembership associationMembership =
        AssociationMembership(associationId: associationId, role: Role.admin);
    try {
      await _updateUserWithMembership.call(user.id, associationMembership);
    } catch (e) {
      log('Failed to update user with membership: $e'); // You can replace this with your preferred error logging method
      throw Exception('Failed to update user with membership');
    }
  }

  void createAssociation() async {
    Get.toNamed(AppRouteNames.createAssociationLoader);
    await addAssociation();
  }
}
