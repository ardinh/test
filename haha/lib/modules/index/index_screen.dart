// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, invalid_use_of_protected_member

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:haha/models/product.dart';
import 'package:haha/modules/index/index_controller.dart';
import 'package:haha/routes/routes.dart';
import 'package:haha/shared/constants/colors.dart';
import 'package:haha/shared/list_panel.dart';
import 'package:haha/shared/message.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';
import 'package:reaction_askany/reaction_askany.dart';

class IndexScreen extends GetView<IndexController> {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GetBuilder<IndexController>(
        init: IndexController(apiRepository: Get.find(), storage: Get.find()),
        builder: (c) {
          return _buildWidget(context);
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
      Obx(
        () => Scaffold(
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/99/b1/2b/99b12b4652764ce926cd908ec1947842.jpg'),
                        maxRadius: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Diana Summers",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 16),
                          ),
                          Icon(
                            Icons.check_circle_outlined,
                            size: 16,
                            color: ColorConstants.colorBlue1,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.videocam_outlined,
                    color: Colors.orange[200],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.call_rounded,
                    color: Colors.orange[200],
                  ),
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: controller.chatMessage.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MessageWidget(
                      emotions: controller.chatMessage[index].emotions,
                      chatMessage: controller.chatMessage.value[index],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 16, bottom: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.orange,
                              size: 21,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Type message...",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade500),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          width: 50,
                          height: 50,
                          child: Center(
                            child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Colors.blue,
                              elevation: 0,
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      )
    ];
    return Obx(() => Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) => controller.pages.value[index],
            itemCount: controller.pages.value.length,
            onPageChanged: (index) {
              controller.currentIndex.value = index;
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
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
        ));
  }

  Future<void> _onAction(Product item, BuildContext context) async {
    await controller.onView(item);
    Get.toNamed(Routes.detail, preventDuplicates: false);
  }
}
