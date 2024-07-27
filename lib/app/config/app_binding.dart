import 'package:get/get.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import '../../presentation/controllers/export_controllers.dart';
import 'package:manzon/domain/usecases/export_domain_repositories.dart';
import 'package:manzon/infrastructure/services/local_storage_service.dart';
import '../../infrastructure/repositories/export_infrastructure_repositories.dart';
import 'package:manzon/infrastructure/data_sources/firebase/export_firebase_data_source.dart';




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
