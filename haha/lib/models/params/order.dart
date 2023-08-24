class Order {
  String column;
  String dir;

  Order({
    this.column = '',
    this.dir = 'asc',
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        column: json["column"],
        dir: json["dir"],
      );

  Map<String, dynamic> toJson() => {
        "column": column,
        "dir": dir,
      };
}
