import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haha/modules/index/index_controller.dart';
import 'package:haha/shared/constants/constants.dart';

class IndexDetail extends GetView<IndexController> {
  const IndexDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          child: controller.data.value!.getItem(context),
        ));
  }
}
