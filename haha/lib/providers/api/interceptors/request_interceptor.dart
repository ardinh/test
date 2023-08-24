import 'dart:async';
import 'dart:io' show Platform;

//import 'package:haha/shared/shared.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:haha/shared/configs/configs.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(request) async {
  var storage = Get.find<FlutterSecureStorage>();

  // final deviceToken = await storage.read(key: StorageConfig.deviceToken);
  // final accessToken = await storage.read(key: StorageConfig.accessToken);

  // //request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Content-Type'] = 'application/json';
  // request.headers['Accept'] = 'application/json';
  // request.headers['User-Agent'] = Platform.operatingSystem;

  // if (deviceToken != null && deviceToken.toString().isNotEmpty) {
  //   request.headers['X-Authorization'] = deviceToken;
  // }
  // if (accessToken != null && accessToken.toString().isNotEmpty) {
  //   request.headers['Authorization'] = 'Bearer $accessToken';
  // }
  EasyLoading.show(
    dismissOnTap: true,
  );
  // var connectivityResult = await (Connectivity().checkConnectivity());
  // if (connectivityResult == ConnectivityResult.mobile && request != null) {
  //   print('koneksi mobile');
  // } else if (connectivityResult == ConnectivityResult.wifi) {
  //   print('koneksi wifi');
  // } else if (connectivityResult == ConnectivityResult.none) {
  //   EasyLoading.dismiss();
  //   Get.snackbar(
  //     "Masalah Jaringan",
  //     "Yahh... Sepertinya kamu kehilangan jaringan, coba lagi saat jaringan kembali",
  //     icon: Icon(Icons.check, color: ColorConstants.colorBackground),
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: ColorConstants.colorError,
  //     borderRadius: 20,
  //     margin: const EdgeInsets.all(15),
  //     colorText: Colors.white,
  //     duration: const Duration(seconds: 2),
  //     isDismissible: true,
  //     dismissDirection: DismissDirection.horizontal,
  //     forwardAnimationCurve: Curves.easeOutBack,
  //   );
  // }
  return request;
}
