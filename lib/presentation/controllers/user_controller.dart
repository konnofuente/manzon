import 'package:get/get.dart';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/presentation/widgets/toast_utils.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/domain/usecases/user/add_user_usecase.dart';
import 'package:manzon/domain/usecases/user/get_user_by_id_usecase.dart';
import 'package:manzon/infrastructure/services/local_storage_service.dart';

class UserController extends GetxController {
  final AddUserUseCase addUserUseCase;
  final GetUserByIdUseCase getUserByIdUseCase;
  final ConnectivityService connectivityService = Get.find();
  final LocalStorageService localStorageService = LocalStorageService();

  UserController({
    required this.addUserUseCase,
    required this.getUserByIdUseCase,
  });

  var user = Rxn<UserEntity>();

  Future<void> addUser(UserEntity user) async {
    bool isConnected = await connectivityService.checkConnectivity();

    if (!isConnected) {
      ToastUtils.showError(
        Get.context!,
        "No Internet Connection",
        "Please check your connection and try again.",
      );
      return;
    }

    try {
      await addUserUseCase.call(user);
      await localStorageService.saveUser(user);
    } catch (e) {
      ToastUtils.showError(
        Get.context!,
        "Error",
        "Failed to add user. Please try again later.",
      );
    }
  }

  Future<void> getUserById(String id) async {
    bool isConnected = await connectivityService.checkConnectivity();

    if (!isConnected) {
      ToastUtils.showError(
        Get.context!,
        "No Internet Connection",
        "Please check your connection and try again.",
      );
      return;
    }

    try {
      user.value = await getUserByIdUseCase(id);
      await localStorageService.saveUser(user.value!);
    } catch (e) {
      print('Error in getUserByID: $e');
      ToastUtils.showError(
        Get.context!,
        "Error",
        "Failed to fetch user. Please try again later.",
      );
    }
  }

  // Future<void> updateUser(UserEntity updatedUser, BuildContext context) async {
  //   try {
  //     await updateUserUseCase(updatedUser);
  //     ToastUtils.showSuccess(context, 'Success', 'User updated successfully');
  //   } catch (e) {
  //     ToastUtils.showError(context, 'Error', e.toString());
  //   }
  // }

  // Future<void> deleteUser(String id, BuildContext context) async {
  //   try {
  //     await deleteUserUseCase(id);
  //     ToastUtils.showSuccess(context, 'Success', 'User deleted successfully');
  //   } catch (e) {
  //     ToastUtils.showError(context, 'Error', e.toString());
  //   }
  // }
}
