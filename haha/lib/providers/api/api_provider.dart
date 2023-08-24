import 'dart:convert';

import 'package:haha/providers/api/base_provider.dart';
import 'package:get/get.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getData(String path) {
    return get(path);
  }

  Future<Response> postData(String path, {body}) async {
    var sBody = await getEncryptedRequest(body);
    return post(path, sBody, contentType: 'application/json')
        .onError((error, stackTrace) {
      throw Exception(error.toString());
    }).catchError((e) {
      throw Exception(e.toString());
    });
  }

  Future<Response> postDataWE(String path, {body}) async {
    return post(path, body, contentType: 'application/json')
        .onError((error, stackTrace) {
      throw Exception(error.toString());
    }).catchError((e) {
      throw Exception(e.toString());
    });
  }

  Future<Response> uploadImage(String path, {body}) async {
    return post(path, body, contentType: "multipart/form-data")
        .onError((error, stackTrace) {
      throw Exception(error.toString());
    }).catchError((e) {
      throw Exception(e.toString());
    });
  }

  Map<dynamic, dynamic> removeNullParams(Map<dynamic, dynamic> mapToEdit) {
    final keys = mapToEdit.keys.toList(growable: false);
    for (String key in keys) {
      final value = mapToEdit[key];
      if (value == null) {
        mapToEdit.remove(key);
      } else if (value is Map) {
        mapToEdit.update(key, (dynamic val) => removeNullParams(value));
      }
    }
    return mapToEdit;
  }

/*
  Future<dynamic> getEncryptedRequest(dynamic body) async {
    if (body != null) {
      try {
        return removeNullParams(jsonDecode(jsonEncode(body)));
        //if (SystemParameter.isEncrypted) {
        //    return Encryptor.encrypt(SystemParameter.encryptKey, sBody);
        //}
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return null;
  }

  */
  Future<String?> getEncryptedRequest(dynamic body) async {
    if (body != null) {
      try {
        // print(json.encode(body));
        // print(json.decode(json.encode(body)));
        // print(removeNullParams(json.decode(json.encode(body))));
        // print(json.encode(removeNullParams(json.decode(json.encode(body)))));

        return json.encode(removeNullParams(json.decode(json.encode(body))));
        //if (SystemParameter.isEncrypted) {
        //    return Encryptor.encrypt(SystemParameter.encryptKey, sBody);
        //}
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return null;
  }
}
