class ResponseParam {
  int? total;
  int? limit;
  int? skip;
  dynamic data;

  ResponseParam({this.data, this.limit, this.skip, this.total});

  factory ResponseParam.fromJson(Map<String, dynamic> json) => ResponseParam(
        data: json['products'],
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );

  Map<String, dynamic> toJson() => {
        "product": data,
      };

  List<dynamic> getDataAsList() => data != null ? data as List<dynamic> : [];
}
