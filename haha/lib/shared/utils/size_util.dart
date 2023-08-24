import 'package:flutter/material.dart';

class SizeUtil {
  BuildContext context;
  final int _prototypeDeviceWidth = 494;
  final int _prototypeDeviceHeight = 1280;

  calcularHeight(double objW) =>
      MediaQuery.of(context).size.height * (objW / _prototypeDeviceHeight);
  calcularWidth(double objW) =>
      MediaQuery.of(context).size.width * (objW / _prototypeDeviceWidth);

  SizeUtil(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}
