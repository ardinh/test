import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageConfig {
  static const String ip = 'ip';
  static const String port = 'port';
  static const String userInfo = 'userInfo';
  static const String pass = 'pass';
  static const String db = 'db';
}

class StorageManager {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<FlutterSecureStorage> getInstance() async {
    _storage;
    return _storage;
  }
}
