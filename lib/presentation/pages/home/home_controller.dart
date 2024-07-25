import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/infrastructure/models/user_model.dart';
import 'package:manzon/presentation/widgets/toast_utils.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/domain/usecases/user/get_user_by_id_usecase.dart';
import 'package:manzon/infrastructure/services/local_storage_service.dart';

class HomeController extends GetxController {
  final GetUserByIdUseCase getUserByIdUseCase;
  final ConnectivityService connectivityService = Get.find();
  final LocalStorageService localStorageService = Get.find();

  var associations = <Map<String, String>>[].obs;
  var user = Rxn<UserEntity>();
   final User? currentUser = FirebaseAuth.instance.currentUser;

  HomeController({required this.getUserByIdUseCase});

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
        ToastUtils.showError(Get.context!, 'No Internet', 'Check your connection');
      }
    }
  }

  void fetchAssociations() {
    associations.value = [
      {
        "name": "CERAD",
        "description": "Comité d'exécution des ressortissants des Ndang",
        "location": "Tsinga",
        "imageUrl": "assets/images/peigne1.png",
      },
      {
        "name": "CERAD",
        "description": "Comité d'exécution des ressortissants des Ndang",
        "location": "Tsinga",
        "imageUrl": "assets/images/peigne1.png",
      },
      {
        "name": "CERAD",
        "description": "Comité d'exécution des ressortissants des Ndang",
        "location": "Tsinga",
        "imageUrl": "assets/images/peigne1.png",
      },
    ];
  }
}
