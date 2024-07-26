import 'package:get/get.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/domain/usecases/user/add_user_usecase.dart';
import 'package:manzon/presentation/controllers/user_controller.dart';
import 'package:manzon/domain/usecases/user/get_user_by_id_usecase.dart';
import 'package:manzon/infrastructure/services/local_storage_service.dart';
import 'package:manzon/infrastructure/repositories/user_repository_impl.dart';
import 'package:manzon/domain/usecases/auth/verify_phone_number_use_case.dart';
import 'package:manzon/domain/usecases/associations/add_association_usecase.dart';
import 'package:manzon/infrastructure/data_sources/firebase/user_data_source.dart';
import 'package:manzon/infrastructure/data_sources/firebase/auth_data_source.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';
import 'package:manzon/domain/usecases/auth/sign_in_with_phone_number_use_case.dart';
import 'package:manzon/presentation/controllers/authentification/auth_controller.dart';
import 'package:manzon/domain/usecases/associations/get_association_by_id_usecase.dart';
import 'package:manzon/infrastructure/repositories/auth_repository_implementation.dart';
import 'package:manzon/infrastructure/data_sources/firebase/association_data_source.dart';
import 'package:manzon/infrastructure/repositories/association_repository_implementation.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssociationDataSource());
    final associationDataSource = AssociationDataSource();

    Get.lazyPut(() => AssociationRepositoryImpl(Get.find()));

    final associationRepositoryImp =
        AssociationRepositoryImpl(associationDataSource);

    Get.lazyPut(() => AddAssociationUseCase(associationRepositoryImp));
    final addAssociationUseCase =
        AddAssociationUseCase(associationRepositoryImp);
    Get.lazyPut(() => GetAssociationByIdUseCase(associationRepositoryImp));
    Get.lazyPut(() => CreateAssociationController(addAssociationUseCase));

   

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
        addUserUseCase: addUserUseCase,
        getUserByIdUseCase: getUserByIdUseCase));

    Get.lazyPut<AuthentificationController>(() => AuthentificationController(
        VerifyPhoneNumberUseCase(authRepositoryImp),
        SignInWithPhoneNumberUseCase(authRepositoryImp)));
  }
}
