import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  Future<FlutterSecureStorage> init() async {
    return const FlutterSecureStorage();
  }
}
