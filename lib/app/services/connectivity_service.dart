import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:manzon/presentation/widgets/toast_utils.dart';

class ConnectivityService extends GetxService {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      bool newConnectionStatus = result != ConnectivityResult.none;
      if (newConnectionStatus != isConnected.value) {
        isConnected.value = newConnectionStatus;
        if (!newConnectionStatus) {
          ToastUtils.showError(
            Get.context!,
            "no_connection".tr,
            "check_connection".tr,
          );
        } 
      }
    });
  }

  
//return true if the is network connectivity
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
