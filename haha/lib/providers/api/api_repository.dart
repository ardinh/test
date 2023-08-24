import 'dart:async';

import 'package:haha/models/params/input_param.dart';
import 'package:haha/models/params/request_param.dart';
import 'package:haha/models/params/response_param.dart';

import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<ResponseParam?> fetchData(String endPoint, {params}) async {
    InputParam _params = params ?? InputParam();
    _params.pager = _params.pager ?? {"start": 0, "limit": 10};
    RequestParam requestParam = RequestParam(
      name: "haha API",
      version: "V1.0.1",
      url: endPoint,
      lang: "in_ID",
      params: _params,
    );

    final res = await apiProvider.postData(endPoint, body: requestParam);
    if (res.statusCode == 200) {
      return ResponseParam.fromJson(res.body);
    }
    return null;
  }

  Future<ResponseParam?> getData(String endPoint, dynamic id) async {
    final res = await apiProvider.postData(endPoint + '/' + id);
    if (res.statusCode == 200) {
      return ResponseParam.fromJson(res.body);
    }
    return null;
  }

  Future<ResponseParam?> saveData(String endPoint, dynamic model) async {
    final res = await apiProvider.postData(endPoint + "/save", body: model);
    if (res.statusCode == 200) {
      return ResponseParam.fromJson(res.body);
    }
    return null;
  }

  Future<ResponseParam?> deleteData(String endPoint, dynamic id) async {
    final res =
        await apiProvider.postData(endPoint + '/delete/' + id.toString());
    if (res.statusCode == 200) {
      return ResponseParam.fromJson(res.body);
    }
    return null;
  }

  Future<ResponseParam?> dynamicData(String endPoint, dynamic body) async {
    final res = await apiProvider.postData(endPoint, body: body);
    if (res.statusCode == 200) {
      return ResponseParam.fromJson(res.body);
    }
    return null;
  }

  Future<dynamic> dynamicPost(String endPoint, dynamic body) async {
    final res = await apiProvider.postData(endPoint, body: body);
    if (res.statusCode == 200) {
      return res.body;
    }
    return res.body;
  }

  Future<dynamic> dynamicPostWE(String endPoint, dynamic body) async {
    final res = await apiProvider.postDataWE(endPoint, body: body);
    if (res.statusCode == 200) {
      return res.body;
    }
    return res.body;
  }

  Future<dynamic> get(String endPoint) async {
    final res = await apiProvider.getData(endPoint);
    if (res.statusCode == 200) {
      return ResponseParam.fromJson(res.body);
    }
    return res.body;
  }

  Future<dynamic> uploadImage(String endPoint, dynamic body) async {
    final res = await apiProvider.uploadImage(endPoint, body: body);
    if (res.statusCode == 200) {
      return res.body;
    }
    return res.body;
  }
}
