import 'package:flutter/material.dart';

abstract class CoreModel {
  //CoreModel();
  Widget getListItem(BuildContext context);
  List<RowAction> getActions();
}

class RowAction {
  final String? id;
  final IconData? icon;
  final Color? color;
  final String? confirm;

  RowAction({required this.id, required this.icon, this.color, this.confirm});
}
