// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, invalid_use_of_protected_member

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:haha/models/chat_message.dart';
import 'package:haha/models/product.dart';
import 'package:haha/modules/index/index_controller.dart';
import 'package:haha/routes/routes.dart';
import 'package:haha/shared/constants/colors.dart';
import 'package:haha/shared/list_panel.dart';

class IndexScreen extends GetView<IndexController> {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GetBuilder<IndexController>(
        init: IndexController(apiRepository: Get.find(), storage: Get.find()),
        builder: (c) {
          return Obx(() => _buildWidget(context));
        },
      ),
    );
  }

  Widget _buildWidget(BuildContext context) {
    controller.pages.value = [
      Scaffold(
        appBar: AppBar(
          title: Text('List Page'),
        ),
        body: SizedBox(
          child: ListPanel(
            scrollController: controller.scrollController,
            items: controller.datas,
            onAction: (item) => _onAction(item as Product, context),
          ),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          title: Text('Favorite Page'),
        ),
        body: SizedBox(
          child: ListPanel(
            scrollController: controller.scrollController,
            items: controller.dataFavs,
            onAction: (item) => _onAction(item as Product, context),
          ),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          title: Text('Chat with Reactions'),
        ),
        body: Obx(() => ListView.builder(
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages[index];
                return ChatMessageItem(message: message);
              },
            )),
      )
    ];
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => controller.pages.value[index],
        itemCount: controller.pages.value.length,
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.currentIndex.value = index;
          // controller.update();
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  Future<void> _onAction(Product item, BuildContext context) async {
    await controller.onView(item);
    Get.toNamed(Routes.detail, preventDuplicates: false);
  }
}

class ChatMessageItem extends StatelessWidget {
  final ChatMessage message;

  ChatMessageItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Get.find<IndexController>().toggleReaction(message);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message.reaction != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    message.reaction!,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : SizedBox.shrink(),
          ListTile(
            title: Text(message.text),
            subtitle: Text(message.sender),
          ),
        ],
      ),
    );
  }
}
