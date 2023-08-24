import 'package:haha/models/params/order.dart';

class InputParam {
  String? search;
  Map<String, int>? pager;
  List<Order>? orders;
  Map<String, dynamic>? filters;
  Map<String, dynamic>? additionals;

  InputParam({
    this.search,
    this.pager,
    this.orders,
    this.filters,
    this.additionals,
  });

  factory InputParam.fromJson(Map<String, dynamic> json) {
    List<Order> lOrder = [];
    if (json['orders'] != null) {
      List<dynamic> dOrder = json["orders"];
      for (var row in dOrder) {
        lOrder.add(Order.fromJson(row));
      }
    }

    return InputParam(
      search: json['search'] ?? '',
      pager: json['pager'] != null ? Map<String, int>.from(json["pager"]) : {},
      orders: lOrder,
      filters: json['filters'] != null
          ? Map<String, dynamic>.from(json["filters"])
          : {},
      additionals: json['additionals'] != null
          ? Map<String, dynamic>.from(json["additionals"])
          : {},
    );
  }

  Map<String, dynamic> toJson() => {
        "search": search,
        "pager": pager,
        "orders": orders,
        "filters": filters,
        "additionals": additionals,
      };

  addFilter(String key, dynamic val) {
    filters ??= {};
    filters?[key] = val;
  }

  resetPage() {
    if (pager == null) {
      pager = {"start": 0};
    } else {
      pager?["start"] = 0;
    }
  }

  int getLimit() => pager?["limit"] ?? 100;

  int getCurrentPage() => pager?["start"] ?? 0;
  int? totalPage() => pager?["pages"];

  bool hasReachedMax() =>
      totalPage() != null && totalPage() == getCurrentPage();

  int getIndexScroll() => getLimit() * (getCurrentPage());
}
