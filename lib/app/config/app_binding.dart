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
    Get.lazyPut(() => AssociationDataSource());
    final associationDataSource = AssociationDataSource();
    final mediaDataSource = MediaDataSource();

    Get.lazyPut(() => AssociationRepositoryImpl(Get.find()));

    final associationRepositoryImp =
        AssociationRepositoryImpl(associationDataSource);

    final mediaRepository = MediaRepositoryImpl(mediaDataSource);
    Get.lazyPut(()=>UploadAssociationAvatarUseCase(mediaRepository));

    Get.lazyPut(() => AddAssociationUseCase(associationRepositoryImp));
    final addAssociationUseCase =
        AddAssociationUseCase(associationRepositoryImp);

    final uploadAssociationAvatarUseCase = UploadAssociationAvatarUseCase(mediaRepository);

    Get.lazyPut(() => GetAssociationByIdUseCase(associationRepositoryImp));
    Get.lazyPut(() => CreateAssociationController(
        addAssociationUseCase, uploadAssociationAvatarUseCase));

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
