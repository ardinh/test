import 'dart:async';
import 'dart:io' show Platform;

import 'package:haha/shared/configs/configs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> authInterceptor(request) async {
  var storage = Get.find<FlutterSecureStorage>();

  // final deviceToken = await storage.read(key: StorageConfig.deviceToken);
  // final accessToken = await storage.read(key: StorageConfig.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Content-Type'] = 'application/json';
  // request.headers['Accept'] = 'application/json';
  // request.headers['User-Agent'] = Platform.operatingSystem;

  // if (deviceToken.toString().isNotEmpty) {
  //   request.headers['X-Authorization'] = deviceToken;
  // }
  // if (accessToken.toString().isNotEmpty) {
  //   request.headers['Authorization'] = 'Bearer $accessToken';
  // }

  return request;
}
