import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manzon/presentation/widgets/toast_utils.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/domain/usecases/export_domain_repositories.dart';
import 'package:manzon/infrastructure/services/local_storage_service.dart';
import 'package:manzon/infrastructure/data_sources/firebase/export_firebase_data_source.dart';

class HomeController extends GetxController {
  final GetUserByIdUseCase getUserByIdUseCase;
  final GetUserAssociationUseCase getUserAssociationUseCase;
  final ConnectivityService connectivityService = Get.find();
  final LocalStorageService localStorageService =
      Get.put(LocalStorageService());
  final AssociationDataSource associationDataSource = Get.find();

  var associations = <AssociationEntity>[].obs;
  var user = Rxn<UserEntity>();
  var isFetchingAssociations = false.obs; // Reactive boolean for fetching status
  final User? currentUser = FirebaseAuth.instance.currentUser;

  HomeController({
    required this.getUserAssociationUseCase,
    required this.getUserByIdUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchUser();
    fetchAssociations();
  }

  void fetchUser() async {
    bool isConnected = await connectivityService.checkConnectivity();
    if (isConnected) {
      try {
        UserEntity? fetchedUser = await getUserByIdUseCase.call(currentUser!.uid);
        if (fetchedUser != null) {
          user.value = fetchedUser;
          await localStorageService.saveUser(user.value!);
        }
      } catch (e) {
        ToastUtils.showError(Get.context!, 'Error', e.toString());
      }
    } else {
      UserEntity? localUser = await localStorageService.getUser();
      if (localUser != null) {
        user.value = localUser;
      } else {
        ToastUtils.showError(
            Get.context!, 'No Internet', 'Check your connection');
      }
    }
  }

  void fetchAssociations() async {
    isFetchingAssociations.value = true; 
    try {
      var fetchedAssociations = await getUserAssociationUseCase.call();
      associations.value = fetchedAssociations;
    } catch (e) {
      ToastUtils.showError(
          Get.context!, 'Error', 'Failed to fetch associations');
    } finally {
      isFetchingAssociations.value = false; 
    }
  }
}
