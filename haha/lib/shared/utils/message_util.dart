import 'package:haha/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class MessageUtil {
  // opens snackbar
  static void showSnackBar(
      BuildContext context, String message, String type) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: type == "error"
              ? ColorConstants.colorDanger
              : (type == "success"
                  ? ColorConstants.colorSuccess
                  : ColorConstants.colorInfo)),
    );
  }
}
