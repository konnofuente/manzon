import 'package:get/get.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import '../../presentation/controllers/export_controllers.dart';
import 'package:manzon/domain/usecases/export_domain_repositories.dart';
import 'package:manzon/domain/repositories/export_domain_repository.dart';
import 'package:manzon/infrastructure/services/local_storage_service.dart';
import 'package:manzon/infrastructure/repositories/media_repository_implt.dart';
import '../../infrastructure/repositories/export_infrastructure_repositories.dart';
import 'package:manzon/infrastructure/data_sources/firebase/media_data_source.dart';
import 'package:manzon/infrastructure/data_sources/firebase/export_firebase_data_source.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectivityService());
    Get.lazyPut(() => LocalStorageService());
    Get.put(UserDataSource());

    //data stores
    Get.lazyPut(() => AssociationDataSource());
    final associationDataSource = AssociationDataSource();
    final mediaDataSource = MediaDataSource();
    final userDataSource = UserDataSource();

    //repository
    final associationRepositoryImp =
        AssociationRepositoryImpl(associationDataSource);
    final mediaRepository = MediaRepositoryImpl(mediaDataSource);
    final userRepository = UserRepositoryImpl(userDataSource);

    //use cases
    final addUserUseCase = AddUserUseCase(userRepository);
    final updateUserUseCase = UpdateUserUseCase(userRepository);
    final updateUserWithMembership = UpdateUserWithMembership(userRepository);
    final getUserByIdUseCase = GetUserByIdUseCase(userRepository);
    final addAssociationUseCase =
        AddAssociationUseCase(associationRepositoryImp);
    final addMemberToAssociationUseCase =
        AddMemberToAssociationUseCase(associationRepositoryImp);

    final uploadAssociationAvatarUseCase =
        UploadAssociationAvatarUseCase(mediaRepository);

    Get.lazyPut(() => AssociationRepositoryImpl(Get.find()));

    Get.lazyPut(() => UploadAssociationAvatarUseCase(mediaRepository));

    Get.lazyPut(() => AddAssociationUseCase(associationRepositoryImp));
    Get.lazyPut(() => GetUserAssociationUseCase(associationRepositoryImp));
    Get.lazyPut(() => AddMemberToAssociationUseCase(associationRepositoryImp));
    Get.lazyPut(() => UpdateUserUseCase(userRepository));
    Get.lazyPut(() => UpdateUserWithMembership(userRepository));

    Get.lazyPut(() => GetAssociationByIdUseCase(associationRepositoryImp));
    Get.lazyPut(() => CreateAssociationController(
        addAssociationUseCase,
        uploadAssociationAvatarUseCase,
        addMemberToAssociationUseCase,
        updateUserWithMembership));

    final authenticationDataSource = AuthenticationDataSource();
    final authRepositoryImp =
        AuthenticationRepositoryImpl(authenticationDataSource);

    Get.lazyPut(() => GetUserByIdUseCase(userRepository));
    Get.lazyPut(() => UserController(
        addUserUseCase: addUserUseCase,
        getUserByIdUseCase: getUserByIdUseCase));

    Get.lazyPut<AuthentificationController>(() => AuthentificationController(
        VerifyPhoneNumberUseCase(authRepositoryImp),
        SignInWithPhoneNumberUseCase(authRepositoryImp)));

  }
}
