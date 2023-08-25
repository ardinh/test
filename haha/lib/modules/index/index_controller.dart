import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:haha/models/chat_message.dart';
import 'package:haha/models/database.dart';
import 'package:haha/models/product.dart';
import 'package:haha/providers/api/api_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:haha/shared/configs/database.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:sqflite/sqflite.dart';

class IndexController extends GetxController {
  final FlutterSecureStorage storage;
  final ApiRepository apiRepository;
  IndexController({
    required this.apiRepository,
    required this.storage,
  });

  ScrollController scrollController = ScrollController();

  var currentIndex = 0.obs;

  var datas = RxList<Product>();
  var dataFavs = RxList<Product>();
  var data = Rxn<Product>();
  var pages = RxList<Widget>();
  var isFavorite = false.obs;
  var emotion = Rxn<Emotions>();

  RxList<ChatMessage> chatMessage = <ChatMessage>[
    ChatMessage(message: "Hi", reciever: true),
    ChatMessage(message: "This is Louji", reciever: true),
    ChatMessage(message: "from tenkasi", reciever: true),
    ChatMessage(message: "Hey Louji.", reciever: false),
    ChatMessage(message: "What's up", reciever: false),
    ChatMessage(
        message: "I want to learn Mobile Development. ", reciever: true),
    ChatMessage(message: "Which is best framework", reciever: true),
    ChatMessage(message: "Upto me. Flutter will be good", reciever: false),
  ].obs;

  // void toggleReaction(ChatMessage message) {
  //   final index = messages.indexOf(message);
  //   if (index != -1) {
  //     if (messages[index].reaction == null) {
  //       messages[index].reaction = '👍';
  //     } else {
  //       messages[index].reaction = null;
  //     }
  //   }
  // }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onClose();
    await getData();
    await getDataFav();
    update();
  }

  Future<void> getData() async {
    var res = await apiRepository.get("/products");
    if (res != null && res.data != null) {
      if (res.data != null) {
        var data = res.data as List<dynamic>;
        for (var row in data) {
          int i = datas.indexWhere((item) {
            int a = item.id!;
            return a == row['id'];
          });
          Database db = await DatabaseHelper.instance.database;
          List<Map> fav = await db
              .query("favorite", where: 'id = ?', whereArgs: [row['id']]);
          for (var rowFav in fav) {
            row['fav'] = rowFav['favorite'];
          }
          if (i >= 0) {
            datas[i] = Product.fromJson(row);
          } else {
            datas.add(Product.fromJson(row));
          }
        }
        datas.refresh();
      }
    }
  }

  Future<void> onDoubleTap() async {}

  Future<void> getDataFav() async {
    for (var row in datas) {
      int i = datas.indexWhere((item) {
        return row.favorite!;
      });
      int j = dataFavs.indexWhere((item) {
        int a = item.id!;
        return a == row.id;
      });
      if (i >= 0) {
        if (j >= 0) {
          dataFavs[j] = datas[i];
        } else {
          dataFavs.add(row);
        }
      }
    }
    dataFavs.refresh();
  }

  Future<void> updateData(fav, id) async {
    Database db = await DatabaseHelper.instance.database;
    int i = datas.indexWhere((item) {
      int a = item.id!;
      return a == id;
    });
    if (i >= 0) {
      datas[i].favorite = fav;
    }
    if (data.value != null) {
      data.value!.favorite = fav;
    }
    await DatabaseHelper.instance
        .insertData(Favorite(id: id.toString(), favorite: fav.toString()));

    datas.refresh();
    await getDataFav();
    update();
  }

  Future<void> onView(Product item) async {
    data.value = item;
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }
}
