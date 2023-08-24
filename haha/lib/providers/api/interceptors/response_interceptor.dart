import 'dart:async';
import 'dart:convert';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:haha/shared/shared.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();
  String msg = 'Error';
  if (response.statusCode != null && response.statusCode == 200) {
    var responseJson = response.body ?? "";
    msg = !response.body.toString().contains("html")
        ? responseJson != null &&
                responseJson != "" &&
                responseJson['message'] != null
            ? responseJson['message']
            : ((responseJson["status"] != null &&
                    responseJson["status"].toString().isNotEmpty &&
                    responseJson["status"].toString().toLowerCase() == 'error')
                ? 'Error'
                : 'Success')
        : 'Success';
  }
  // var connectivityResult = await (Connectivity().checkConnectivity());
  // if (connectivityResult == ConnectivityResult.mobile) {
  //   print('koneksi mobile');
  // } else if (connectivityResult == ConnectivityResult.wifi) {
  //   print('koneksi wifi');
  // } else if (connectivityResult == ConnectivityResult.none) {
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
  handleMessage(response, msg);

  return response;
}

Future<dynamic> getEncryptedResponse(String sBody) async {
  // if (SystemParameter.isEncrypted && sBody.isNotEmpty) {
  //   try {
  //     sBody = Encryptor.decrypt(SystemParameter.encryptKey, sBody);
  //   } catch (e) {
  //     throw BadRequestException(e);
  //  }
  // }
  return jsonDecode(sBody);
}

void handleMessage(Response response, String def) {
  String msg = def;
  bool isLogout = false;
  if (response.statusCode != null) {
    switch (response.statusCode) {
      case 200:
        msg = def;
        break;
      case 400:
        msg = 'Bad Request';
        break;
      case 401:
        msg = response.body['message'];
        isLogout = true;
        break;
      case 403:
        msg = 'Forbidden';
        break;
      case 404:
        msg = 'Not Found';
        break;
      case 405:
        msg = 'Method not allowed';
        break;
      case 406:
        msg = 'Not acceptable';
        break;
      case 500:
        if (response.bodyString!.contains("device_unaoutorized")) {
          msg = 'Device Unauthorized';
          isLogout = true;
        } else {
          msg = 'Internal Server Error';
        }

        break;
      case 501:
        msg = 'Not implemented';
        break;
      case 502:
        msg = 'Bad Gateway';
        break;
      case 503:
        msg = 'Service unavailable';
        break;
      case 504:
        msg = 'Gateway timeout';
        break;
      case 505:
        msg = 'HTTP version not supported';
        break;
      default:
    }
  }
  return;
}
