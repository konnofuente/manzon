import 'package:get/get.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/domain/repositories/user_repository.dart';
import 'package:manzon/domain/usecases/user/add_user_usecase.dart';
import 'package:manzon/presentation/controllers/user_controller.dart';
import 'package:manzon/domain/usecases/user/get_user_by_id_usecase.dart';
import 'package:manzon/infrastructure/services/local_storage_service.dart';
import 'package:manzon/infrastructure/repositories/user_repository_impl.dart';
import 'package:manzon/domain/usecases/auth/verify_phone_number_use_case.dart';
import 'package:manzon/infrastructure/data_sources/firebase/user_data_source.dart';
import 'package:manzon/infrastructure/data_sources/firebase/auth_data_source.dart';
import 'package:manzon/domain/usecases/auth/sign_in_with_phone_number_use_case.dart';
import 'package:manzon/presentation/controllers/authentification/auth_controller.dart';
import 'package:manzon/infrastructure/repositories/auth_repository_implementation.dart';

void initAppServices() {
  Get.lazyPut(() => ConnectivityService());
  Get.lazyPut(() => LocalStorageService());

  final authenticationDataSource = AuthenticationDataSource();
  final authRepositoryImp =
      AuthenticationRepositoryImpl(authenticationDataSource);

  final userDataSource = UserDataSource();
  final userRepository = UserRepositoryImpl(userDataSource);

  final addUserUseCase = AddUserUseCase(userRepository);
  final getUserByIdUseCase = GetUserByIdUseCase(userRepository);

  Get.lazyPut(() => GetUserByIdUseCase(userRepository));
  Get.lazyPut(() => UserController(
      addUserUseCase: addUserUseCase, getUserByIdUseCase: getUserByIdUseCase));

  Get.lazyPut<AuthentificationController>(() => AuthentificationController(
      VerifyPhoneNumberUseCase(authRepositoryImp),
      SignInWithPhoneNumberUseCase(authRepositoryImp)));
}
