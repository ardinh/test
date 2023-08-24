import 'package:haha/models/params/input_param.dart';

class RequestParam {
  String name;
  String version;
  String url;
  String lang;
  InputParam? params;

  RequestParam({
    this.name = 'Api',
    this.version = 'V1.0.1',
    this.lang = 'in_ID',
    this.url = '',
    this.params,
  });

  factory RequestParam.fromJson(Map<String, dynamic> json) => RequestParam(
        name: json['name'],
        version: json['version'],
        url: json['url'],
        lang: json['lang'],
        params: json['params'] != null
            ? InputParam.fromJson(json['params'])
            : InputParam(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "url": url,
        "lang": lang,
        "params": params,
      };
}
